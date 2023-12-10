import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:hive/hive.dart';

import '../Views/details_view.dart';
import 'package:flutter_html/flutter_html.dart';

part 'card_view_model.g.dart';

typedef VoidCallback = void Function();

@HiveType(typeId: 0)
class CardViewModel extends StatelessWidget {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String imageUrl;
  @HiveField(2)
  final int detailsID;
  @HiveField(3)
  final bool isConstant;
  final void Function() callback;

   const CardViewModel({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.detailsID,
    required this.isConstant,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isConstant
            ? callback()
            : Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsViewModel(
                    detailsId: detailsID,
                    title: title,
                  ),
                ),
              );
      },
      child: Container(
        decoration: BoxDecoration(
          color: isConstant ? constantCardBackgroundColor : cardBackgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        width: 150,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ensignLogo(),
              SizedBox(width: 2), // Adjust this value to control the spacing
              Expanded(child: departmentTitle()),
            ],
          ),
        ),
      ),
    );
  }

  Widget departmentTitle() {
    return  Html(
      data: title, // HTML content
      style: {
        'p': Style(
          // textAlign: TextAlign.center,
          color: Colors.white,
          // fontSize: FontSize(16),
        ),
        'strong': Style(

          color: Colors.white,
        ),
      },

    );
  }

  Widget ensignLogo() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
