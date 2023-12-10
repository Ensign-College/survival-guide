import 'package:flutter/material.dart';

import '../../models/SchedulerShoppingCartModel.dart';

class SchedulerShoppingCartWidget extends StatefulWidget {

  @override
  SchedulerShoppingCartWidgetState createState() =>
      SchedulerShoppingCartWidgetState();
}

class SchedulerShoppingCartWidgetState
    extends State<SchedulerShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    CollegeSchedulerShoppingCartModel shoppingCart = CollegeSchedulerShoppingCartModel(
      sections: [],
      termCode: '',
      userId: 0,
    );
    return const Text('Shopping Cart');
  }
}