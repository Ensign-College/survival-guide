import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';
import 'package:web_socket_channel/io.dart';

import '../models/SchedulerDesiredCoursesModel.dart';
import '../models/SchedulerShoppingCartModel.dart';

typedef ErrorHandler = void Function(String error, String step);

class CollegeSchedulerSocketClient {
  late IOWebSocketChannel socketChannel;
  late StreamSubscription socketSubscription;
  final String token;
  final List<SchedulerDesiredCoursesModel> shoppingCartItems;
  final String termCode;
  final int userId;
  final ErrorHandler onError;
  final SchedulerApiService apiService;
  final String yearTerm;

  // final SchedulerRegBlocksModel registrationNumber;
  CollegeSchedulerSocketClient({
    required this.token,
    required this.shoppingCartItems,
    required this.termCode,
    required this.userId,
    required this.onError,
    required this.apiService,
    required this.yearTerm,
    // required this.registrationNumber,
  }) {
    _initializeSocket();
  }

  void _initializeSocket() async {
    Map<String, dynamic> headers = {
      'Origin': 'https://ensign.collegescheduler.com',
    };
    socketChannel = IOWebSocketChannel.connect(
        'wss://api.collegescheduler.com/socket.io/?EIO=3&transport=websocket',headers: headers);
    await _registerEvents();
  }

  Future<void> _registerEvents() async {

    socketSubscription = socketChannel.stream.listen(
          (dynamic message) {

        try {
          print('Received: $message');
            switch (message) {
              case '40':
                print('Connected successfully: $message');
                _sendAuthorizationMessage();
                break;
              case '41':
                print('Event 41 Response: $message');
                break;
              case '430[{"success":true}]':
                print('Authorization Response: $message');
                sendToCart();
                break;
              case '431':
                print('Send-to-Cart Response: $message');
                break;
              case '42':
                print('Authorization failed: $message');
                break;
              default:
                print('Unknown event: $message');
          }
        } catch (e) {
          printWrapped('Error handling message: $e');
          onError('Error handling message: $e', 'Message Handling');
        }
      },
      onError: (error) {
        print('Socket error: $error');
        onError('Socket error: $error', 'Socket Connection');
      },
      onDone: () {
        print('Connection closed.');
        socketSubscription.cancel();
      },
      cancelOnError: false,
    );
  }

  void _sendAuthorizationMessage() {
    try {
      String authMessage = '420["authorize",{"token":"$token"}]';
      debugPrint('Sending authorization token: $authMessage');
      socketChannel.sink.add(authMessage);
    } catch (e) {
      print('Error sending authorization message: $e');
      onError('Error sending authorization message: $e', 'Authorization');
    }
  }

  Future<void> sendToCart() async {

    List<SchedulerRegBlocksModel> registrationBlocks = [];

    for (var item in shoppingCartItems) {
      var block = await apiService.fetchRegistrationBlocks(yearTerm, item.subjectShort, item.number);
      registrationBlocks.add(block);
    }

    List<ShoppingCartSection> shoppingCartSections = mapToShoppingCartSections(shoppingCartItems, registrationBlocks);
    final shoppingCart = CollegeSchedulerShoppingCartModel(
      sections: shoppingCartSections,
      termCode: termCode,
      userId: userId,
    );
    try {
      String shoppingCartJson = jsonEncode(shoppingCart.toJson());
      String cartRequestMessage = '421["send-to-cart-request", $shoppingCartJson]';
      debugPrint('Sending to cart request: $cartRequestMessage');
      socketChannel.sink.add(cartRequestMessage);
    } catch (e) {
      print('Error sending to cart request: $e');
      onError('Error sending to cart request: $e', 'Cart Request');
    }
  }


  void closeConnection() {
    socketSubscription.cancel();
    socketChannel.sink.close(1000, 'Bye');
  }
}
