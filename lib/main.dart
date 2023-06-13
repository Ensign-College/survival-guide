import 'package:flutter/material.dart';
import 'package:survival_guide/ViewModels/CardViewModel.dart';
import 'package:survival_guide/Views/DirectoryGridView.dart';
import 'package:survival_guide/Views/FindBar.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/directory.dart';

import 'constants/fetching_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FindBar(
        onSearchTextChanged: (String value) {},
        title: 'Advising',
      ),
      appBar: AppBar(
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Draft()));
        }, icon: const Icon(Icons.search))],
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: DirectoryGridView(children: directoryCards),
      ),
    );
  }
}
