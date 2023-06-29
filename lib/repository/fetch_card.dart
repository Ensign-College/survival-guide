
import 'dart:convert';
import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:realtime_client/realtime_client.dart';

import '../ViewModels/CardViewModel.dart';

class DataService {
  final supabase = Supabase.instance.client;

  Future<List<CardViewModel>> fetchData() async {
    final response =
    await supabase.from('card').select().order('id', ascending: true);

    // Check if the response contains data and no error
    if (response != null) {
      // Map the data to CardViewModel and return it as a List
      return (response as List).map((e) {
        return CardViewModel(
          title: e['title'] as String,
          imageUrl: e['image_logo'] as String,
        );
      }).toList();
    } else {
      print("response.statusCode: ${response.status}"); // This is the response status code
      print("response.error: ${response.error}"); // This is the response error
      throw Exception('Failed to load data');
    }
  }

}
