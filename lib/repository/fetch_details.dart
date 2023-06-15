import 'dart:convert';
import 'package:http/http.dart' as http;

class CardDetails {
  final String title;
  final String details;
  final int id;
  final int cardId;

  CardDetails({required this.title, required this.details, required this.id, required this.cardId});
}

class DetailsService {
  Future<List<CardDetails>> fetchDetails() async {
    final response =
        await http.get(Uri.parse('http://192.168.169.106:8000/CardDetails/'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      print('------------- response body --------- dataservice list');
      print(response.body);
      List<dynamic> data = jsonDecode(response.body);
      return data
          .map((item) => CardDetails(
                title: item['title'],
                details: item['details'],
                id: item['id'],
                cardId: item['card_id'],
              ))
          .toList();
    } else {
      // Handle the error
      throw Exception('Failed to load data');
    }
  }
}
