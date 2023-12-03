import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:survival_guide/Views/custom_text_parser.dart';
import 'package:survival_guide/constants/colors.dart';

import '../constants/supabase.dart';

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
  List<String> images = [];
  bool isLoaded = false;
  bool shouldLoadImages = false;
  double _fontSize = 16.0;

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

  void _getDetails() async {
    final detailsId = widget.detailsId;
    final details =
        await supabase.from('card_details').select().eq('id', detailsId);
    setState(() {
      text = details[0]['text'];
      images = List<String>.from(
          details[0]['pictures'].map((item) => item as String));
      debugPrint('images ${images.toString()}');
      shouldLoadImages = (images.isEmpty);
      isLoaded = true;
    });
  }

  void _increaseFontSize() {
    setState(() {
      _fontSize += 2.0;
    });
  }

  void _decreaseFontSize() {
    setState(() {
      _fontSize -= 2.0;
    });
  }

  Center imagesWidget() {
    return Center(
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: images
            .map((url) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(url.trim(), fit: BoxFit.cover),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
  Widget htmlView(String text) {
    return Html(
        data: text,
      style: {
        'p': Style(
          textAlign: TextAlign.center,
          color: Colors.white,
          fontSize: FontSize(16.0),
          margin: Margins(left: Margin(-50, Unit.px), right: Margin.auto()),
        ),
        'strong': Style(
          fontWeight: FontWeight.bold,
        ),
      }
    );
  }


  Widget htmlTextView(String text, double fontSize) {
    return  Html(
      data: text, // HTML content
      style: {
        'p': Style(
          textAlign: TextAlign.center,
          color: Colors.white,
          fontSize: FontSize(fontSize),
        ),
        'strong': Style(
          fontWeight: FontWeight.bold,
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? Scaffold(
            appBar: AppBar(
              title: Center(child: htmlView(widget.title)),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Column(children: [
              shouldLoadImages ? const SizedBox.shrink() : Expanded(
                flex: (images.first.toString() == '') ? 0 : 1,
                // Once we fetch data from supabase our array is populated with "", therefore it is not empty anymore
                child: (images.first.toString() == '')
                    ? const SizedBox.shrink()
                    : imagesWidget(),
              ),
              Expanded(
                flex: 2,
                child: SingleChildScrollView(child: htmlTextView(text, _fontSize)),
              ),
            ]),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: cardBackgroundColor,
                  onPressed: _increaseFontSize,
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 16.0),
                FloatingActionButton(
                  backgroundColor: cardBackgroundColor,
                  onPressed: _decreaseFontSize,
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: htmlView(widget.title),
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
