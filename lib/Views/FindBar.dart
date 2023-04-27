import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';

class FindBar extends StatelessWidget {
  final ValueChanged<String> onSearchTextChanged;
  final String title;
  const FindBar({required this.onSearchTextChanged, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onSearchTextChanged,
        style: const TextStyle(color: Colors.white),
        decoration:  InputDecoration(
          labelText: 'Find in $title',
          hintText: 'Type your search query',
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.white),
          fillColor: CardBackgroundColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          suffixIcon:const Icon(Icons.search, color: Colors.white),
        ),
      ),
    );
  }
}
