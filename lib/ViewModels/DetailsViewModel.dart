import 'package:flutter/material.dart';

import '../Views/FindBar.dart';

class DetailsViewModel extends StatefulWidget {
  const DetailsViewModel({super.key});

  @override
  _DetailsViewModelState createState() => _DetailsViewModelState();
}

class _DetailsViewModelState extends State<DetailsViewModel> {
  String _searchText = '';

  void _setSearchText(String text) {
    setState(() {
      _searchText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('My StatefulWidget View')),
      body: Column(
        children: [
         const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque posuere...',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          FindBar(
            onSearchTextChanged: _setSearchText,
          ),
        ],
      ),
    );
  }
}