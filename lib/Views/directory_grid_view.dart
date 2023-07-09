import 'package:flutter/material.dart';

class DirectoryGridView extends StatelessWidget {
  final List<Widget> children;

  const DirectoryGridView({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: (1 / .45),
      padding: const EdgeInsets.all(8),
      children: children,
    );
  }
}
