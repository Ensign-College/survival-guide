import 'package:flutter/material.dart';
import 'package:survival_guide/Views/CustomTextParser.dart';

import '../constants/supabase.dart';
import 'FindBar.dart';

class DetailsViewModel extends StatefulWidget {
  final int detailsId;
  const DetailsViewModel({super.key, required this.detailsId});

  @override
  _DetailsViewModelState createState() => _DetailsViewModelState();
}

class _DetailsViewModelState extends State<DetailsViewModel> {
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    callFunctions();
  }

  Future<void> callFunctions() async {
    _getDetails;
  }

  String _searchText = '';

  void _getDetails() async {
    final detailsId = widget.detailsId;
    final details = await supabase.from('card_details').select('''
      $detailsId,
      id (
        $detailsId
      )
  ''');
    print("Details: " + details);
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
        title: const Text(
          "sup",
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const Expanded(
            child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: CustomTextParserWidget(
                    text: "sd",
                  )),
            ),
          ),
          FindBar(
            onSearchTextChanged: _setSearchText,
            title: "sdf",
          ),
        ],
      ),
    );
  }
}
