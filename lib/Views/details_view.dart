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
  String text = "no text";
  List<String> images = [];

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
    // debugPrint("details" + details.toString());
    setState(() {
      text = details[0]['text'];
      images = List<String>.from(
          details[0]['pictures'].map((item) => item as String));
      print("Details: " + images.toString());
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
      body: Column(children: [
        if (images.first != "") ...[
          Expanded(
            flex: 1,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: images
                    .map((url) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.0), // adjust as needed
                              child: Image.network(url, fit: BoxFit.cover),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: CustomTextParserWidget(
              text: text,
            ),
          ),
        ] else ...[
          Text("Loading data")
        ],
      ]),
    );
  }
}
