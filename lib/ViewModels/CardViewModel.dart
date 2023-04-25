import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';

class CardViewModel extends StatelessWidget {
  final String title;

  const CardViewModel({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('$title tapped.');
      },
      child: Container(
        decoration: BoxDecoration(
          color: CardBackgroundColor,
          borderRadius: BorderRadius.circular(24),
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
