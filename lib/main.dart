import 'package:flutter/material.dart';
import 'package:survival_guide/pages/my_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';


Future<void> main() async {
  await Supabase.initialize(
    url: 'https://ehyfnzsinagvuifstdkx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVoeWZuenNpbmFndnVpZnN0ZGt4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODY4NDU2NjYsImV4cCI6MjAwMjQyMTY2Nn0.UiAdrjIs8xET7QhUgnqayEPFLnU-8rN_IE5r4ymLkRM',
  );

  runApp(const MyApp());
}
