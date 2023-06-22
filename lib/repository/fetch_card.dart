import 'package:supabase_flutter/supabase_flutter.dart';

class CardData {
  final String title;
  final String imageUrl;

  const CardData({required this.title, required this.imageUrl});
}

class DataService {
  final supabase = Supabase.instance.client;

  Future<List<CardData>> fetchData() async {
    final response =
        await supabase.from('card').select().order('id', ascending: true);

    if (response != null) {
      // Parse the JSON data
      print("------------------");
      print("response: ${response}"); // This is the response body
      return response
          .map((item) => CardData(
                title: item['title'],
                imageUrl: item[
                    'image_logo'], // Note that I changed 'logo_image_url' to 'image_logo' as per your previous messages
              ))
          .toList();
    } else {
      // Handle the error
      print(
          "response.statusCode: ${response.statusCode}"); // This is the response body
      print("response.body: ${response.body}"); // This is the response body
      throw Exception('Failed to load data');
    }
  }
}
