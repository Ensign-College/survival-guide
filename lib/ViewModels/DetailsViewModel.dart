import 'package:flutter/material.dart';
import 'package:survival_guide/Views/CustomTextParser.dart';

import '../Views/FindBar.dart';

class DetailsViewModel extends StatefulWidget {
  final String title;
  final String text;

  const DetailsViewModel({super.key, required this.title, required this.text});

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
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: CustomTextParserWidget(
                    text: widget.text,
                  )),
            ),
          ),
          FindBar(
            onSearchTextChanged: _setSearchText,
            title: widget.title,
          ),
        ],
      ),
    );
  }
}
