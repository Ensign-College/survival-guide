import 'package:flutter/material.dart';
import 'package:survival_guide/Views/custom_text_parser.dart';

import '../constants/supabase.dart';
import 'find_bar.dart';

class DetailsViewModel extends StatefulWidget {
  final int detailsId;
  final String title;
  const DetailsViewModel(
      {super.key, required this.detailsId, required this.title});

  @override
  DetailsViewModelState createState() => DetailsViewModelState();
}

class DetailsViewModelState extends State<DetailsViewModel> {
  String text = 'no text';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDetails();
    });
  }

  Future<void> callFunctions() async {
    _getDetails;
  }

  // ignore: unused_field
  String _searchText = '';

  void _getDetails() async {
    final detailsId = widget.detailsId;
    final details =
        await supabase.from('card_details').select().eq('id', detailsId);
    // print("Details: " + details.toString());
    // debugPrint("details" + details.toString());
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
                  padding: const EdgeInsets.all(16),
                  child: CustomTextParserWidget(
                    text: text,
                  )),
            ),
          ),
          FindBar(
            onSearchTextChanged: _setSearchText,
            title: widget.title,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
