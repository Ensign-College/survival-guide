import 'dart:convert';

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
    print(response);


    print("-----------------");

    for (final item in response) {
      loadedItems.add(CardViewModel(
          title: item['title'], imageUrl: item['image_logo']));
    }

    setState(() {
      directoryCards3 = loadedItems;
    });
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
