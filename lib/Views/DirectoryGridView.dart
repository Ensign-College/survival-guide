import 'package:flutter/material.dart';

class DirectoryGridView extends StatelessWidget {
  final List<Widget> children;

  DirectoryGridView({required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: children,
    );
  }
}
