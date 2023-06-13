import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:survival_guide/ViewModels/CardViewModel.dart';
import 'package:http/http.dart' as http;

import '../Views/DirectoryGridView.dart';

List<CardViewModel> directoryCards2 = const [];

class Draft extends StatefulWidget {
  const Draft({super.key});

  @override
  State<Draft> createState() => _DraftState();
}

class _DraftState extends State<Draft> {

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final url = Uri.https(
        'ensign-proyect-default-rtdb.firebaseio.com', 'help-list.json');
    final response = await http.get(url);
    // print(response.body);

    final Map<String, dynamic> responseData = json.decode(response.body);
    final List<CardViewModel> loadedItems = [];
    // print(responseData);

    // print("-----------------");

    for (final item in responseData.entries){ //Esto es para crear varios objetos de tipo CardViewModel
      loadedItems.add(CardViewModel(
        title: item.key,
        text: item.value['text'],
      )); 

      setState(() {
        directoryCards2 = loadedItems;
      });

      // print(item.key);
      // print(item.value['text']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Scaffold(body: DirectoryGridView(children: directoryCards2),),
    );
  }
}
