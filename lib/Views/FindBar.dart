import 'package:flutter/material.dart';

class FindBar extends StatelessWidget {
  final ValueChanged<String> onSearchTextChanged;

  const FindBar({required this.onSearchTextChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onSearchTextChanged,
        decoration: InputDecoration(
          labelText: 'Find text',
          hintText: 'Type your search query',
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
