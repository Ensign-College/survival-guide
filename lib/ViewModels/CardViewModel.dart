import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';

import 'DetailsViewModel.dart';

class CardViewModel extends StatelessWidget {
  final String title;
  final String text;

  const CardViewModel({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsViewModel(title: title, text: text),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: CardBackgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 150,
        child: Center(
          child: ListTile(
            leading: ensignLogo(),
            title: departmentTitle(),
          ),
        ),
      ),
    );
  }

  Text departmentTitle() {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget ensignLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Ensign_Logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
