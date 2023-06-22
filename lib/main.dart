import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';
import 'Views/home.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://ehyfnzsinagvuifstdkx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVoeWZuenNpbmFndnVpZnN0ZGt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODY4NDU2NjYsImV4cCI6MjAwMjQyMTY2Nn0.UiAdrjIs8xET7QhUgnqayEPFLnU-8rN_IE5r4ymLkRM',
  );
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
