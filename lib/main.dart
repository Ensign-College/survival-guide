import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';
import 'Views/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables from .env.local file
  await dotenv.load(fileName: "lib/.env");

  // Access the environment variables
  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  var supabase = await Supabase.initialize(
    url: supabaseUrl!,
    anonKey: supabaseAnonKey!,
  );

  var client = RealtimeClient(supabaseUrl!);
  client.connect();
  client.onOpen(() => print('Socket opened.'));
  client.onClose((event) => print('Socket closed $event'));
  client.onError((error) => print('Socket error: $error'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppBackgroundColor),
      home: const MyHomePage(title: "Welcome to Ensign College"),
    );
  }
}
