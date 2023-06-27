import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class CardData {
  final String title;
  final String imageUrl;

  CardData({required this.title, required this.imageUrl});
}

class DataService {


  // Future<List<CardData>> fetchData() async {
  //       await dotenv.load(fileName: ".env");
  //   var supabaseUrl = dotenv.env['SUPABASE_URL']!;
  //   var supabaseApiKey = dotenv.env['SUPABASE_ANON_KEY']!;
  //   final response = await http.get(
  //     Uri.parse('$supabaseUrl/rest/v1/Cards'),
  //     headers: {'apikey': supabaseApiKey, 'Content-Type': 'application/json'},
  //   );
  //
  //   if (response.statusCode == 200) {
  //     // Parse the JSON data
  //     List<dynamic> data = jsonDecode(response.body);
  //     return data.map((item) => CardData(
  //       title: item['title'],
  //       imageUrl: item['image_logo'], // Note that I changed 'logo_image_url' to 'image_logo' as per your previous messages
  //     )).toList();
  //   } else {
  //     // Handle the error
  //     throw Exception('Failed to load data');
  //   }
  // }
}