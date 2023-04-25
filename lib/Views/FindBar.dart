import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';

class FindBar extends StatelessWidget {
  final ValueChanged<String> onSearchTextChanged;

  const FindBar({required this.onSearchTextChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onSearchTextChanged,
        style: TextStyle(color: Colors.white),
        decoration:  InputDecoration(
          labelText: 'Find text',
          hintText: 'Type your search query',
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          fillColor: CardBackgroundColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          suffixIcon: Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}
