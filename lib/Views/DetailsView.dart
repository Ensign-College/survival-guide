import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:survival_guide/Views/CustomTextParser.dart';

import '../constants/supabase.dart';
import 'FindBar.dart';

class DetailsViewModel extends StatefulWidget {
  final int detailsId;
  final String title;
  const DetailsViewModel(
      {super.key, required this.detailsId, required this.title});

  @override
  _DetailsViewModelState createState() => _DetailsViewModelState();
}

class _DetailsViewModelState extends State<DetailsViewModel> {
  String text = "no text";

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDetails();
    });
  }

  Future<void> callFunctions() async {
    _getDetails;
  }

  String _searchText = '';

  void _getDetails() async {
    final detailsId = widget.detailsId;
    final details =
        await supabase.from('card_details').select().eq('id', detailsId);
    print("Details: " + details.toString());
    debugPrint("details" + details.toString());
    setState(() {
      text = details[0]['text'];
    });
  }

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
                  padding: EdgeInsets.all(16),
                  child: CustomTextParserWidget(
                    text: text,
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
