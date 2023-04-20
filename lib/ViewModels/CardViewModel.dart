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
    return Container(
      decoration: BoxDecoration(
          color: CardBackgroundColor,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            )
          ]),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AspectRatio(
                aspectRatio:
                    1.0, // Set the aspect ratio to maintain the image's proportions
                child: Image.asset(
                  'assets/images/Ensign_Logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
