import 'dart:convert';
import 'package:http/http.dart' as http;

class CardData {
  final String title;
  final String imageUrl;

  CardData({required this.title, required this.imageUrl});
}

class DataService {
  Future<List<CardData>> fetchData() async {
    final response = await http.get(Uri.parse('http://192.168.169.106:8000/Cards/'));

    if (response.statusCode == 200) {
      // Parse the JSON data
      List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CardData(
        title: item['title'],
        imageUrl: item['logo_image_url'],
      )).toList();
    } else {
      // Handle the error
      throw Exception('Failed to load data');
    }
  }
}
