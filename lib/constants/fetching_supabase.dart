import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../ViewModels/CardViewModel.dart';
import '../Views/DirectoryGridView.dart';

List<CardViewModel> directoryCards3 = [];

class Supabasefe extends StatefulWidget {
  const Supabasefe({super.key});

  @override
  State<Supabasefe> createState() => _SupabaseStatefe();
}

class _SupabaseStatefe extends State<Supabasefe> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final List<CardViewModel> loadedItems = [];
    final response = await Supabase.instance.client
        .from('card')
        .select()
        .order('id', ascending: true);
    print("hola");
    print(response);
    print("-----------------");
    print(response[0]);
    print("-----------------");
    print(response[0]['title']);
    print("-----------------");
    print(response.runtimeType);
    final titles = response.map((item) => item['title']).toList();
    for (final title in titles) {
      loadedItems.add(CardViewModel(
        title: title,
        text: title,
      ));
      print(title);

      setState(() {
        directoryCards3 = loadedItems;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching data form supabase '),
      ),
      body: DirectoryGridView(children: directoryCards3),
    );
  }
}
