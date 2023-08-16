import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:hive/hive.dart';

import '../Views/details_view.dart';

part 'card_view_model.g.dart';

typedef void VoidCallback();

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
  void Function() callback;

   CardViewModel({
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
