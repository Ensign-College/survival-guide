import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';


class CardData {
  final String title;
  final String imageUrl;

  CardData({required this.title, required this.imageUrl});
}

class DataService {

  final supabase = Supabase.instance.client;

  Future<List<CardData>> fetchData() async {
    var supabaseUrl = dotenv.env['SUPABASE_URL']!;
    var supabaseApiKey = dotenv.env['SUPABASE_ANON_KEY']!;
    final response = await supabase
        .from('card')
        .select()
        .order('id', ascending: true);


    if (response != null) {
      // Parse the JSON data
      print("response: ${response}"); // This is the response body
      return response.map((item) => CardData(
        title: item['title'],
        imageUrl: item['image_logo'], // Note that I changed 'logo_image_url' to 'image_logo' as per your previous messages
      )).toList();
    } else {
      // Handle the error
      print("response.statusCode: ${response.statusCode}"); // This is the response body
      print("response.body: ${response.body}"); // This is the response body
      throw Exception('Failed to load data');
    }
  }
}