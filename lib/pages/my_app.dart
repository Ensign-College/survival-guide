
import 'package:flutter/material.dart';
import 'package:survival_guide/ViewModels/CardViewModel.dart';
import 'package:survival_guide/Views/DirectoryGridView.dart';
import 'package:survival_guide/Views/FindBar.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/repository/fetch_card.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(scaffoldBackgroundColor: AppBackgroundColor),
      home: const MyHomePage(title: "Welcome to Ensign College"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CardViewModel> cards = [];
  final dataService = DataService();
  List<CardData> cardData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      cardData = await dataService.fetchData();
      cards = cardData
          .map((card) =>
              CardViewModel(title: card.title, imageUrl: card.imageUrl))
          .toList();
      setState(() {}); // Notify the framework that the
      setState(() {});
    } catch (e) {
      // Handle the error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FindBar(
        onSearchTextChanged: (String value) {},
        title: 'Advising',
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DirectoryGridView(children: cards)));
              },
              icon: const Icon(Icons.search))
        ],
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: DirectoryGridView(
          children: cards
              .map((card) => CardViewModel(
                    title: card.title,
                    imageUrl: card.imageUrl,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
