import 'dart:math';

import 'package:flutter/material.dart';

import 'model/checkbox_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final notifications = [
    CheckboxState(title: 'Notification 1'),
    CheckboxState(title: 'Notification 2'),
    CheckboxState(title: 'Notification 3'),
    CheckboxState(title: 'Notification 4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ...notifications.map(buildSingleCheckbox).toList(),
        ],
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildSingleCheckbox(CheckboxState checkboxState) => CheckboxListTile(
        value: checkboxState.value,
        onChanged: (value) => setState(() {
          checkboxState.value = value!;
          print('asdasd');
        }),
        title: Text(checkboxState.title),
        controlAffinity: ListTileControlAffinity.leading,
      );
}
