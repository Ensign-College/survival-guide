
import 'package:flutter/material.dart';
import 'package:survival_guide/Views/DirectoryGridView.dart';
import 'package:survival_guide/Views/FindBar.dart';
import 'package:survival_guide/constants/directory.dart';
// import '../constants/fetching_data.dart';
import '../constants/fetching_supabase.dart';



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
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Supabasefe()));
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
