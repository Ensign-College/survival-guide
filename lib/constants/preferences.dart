import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getValueFromPreferences(String prefKey) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(prefKey);
}