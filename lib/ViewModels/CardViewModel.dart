import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';

import '../repository/fetch_details.dart';
import 'DetailsViewModel.dart';

class CardViewModel extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CardViewModel({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);



  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  Future<void> fetchData() async {
  final dataService = DetailsService();
  List<DetailsViewModel> cards = [];
  List<CardDetails> cardData = [];
    try {
      cardData = await dataService.fetchDetails();
      print('------------- cardData ---------');
      print(cardData);
      cards = cardData
          .map((card) =>
              DetailsViewModel(title: card.title, text: card.details ))
          .toList();
      // setState(() {});
    } catch (e) {
      // Handle the error
      print(e);
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('------------- title ---------');
        print(title);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsViewModel(title: title, text: "stuff"),
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
       decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
