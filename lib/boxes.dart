import 'package:hive/hive.dart';

import 'ViewModels/card_view_model.dart';

class Boxes {
  static Box<CardViewModel> getCardViewModel() =>
      Hive.box<CardViewModel>('cards');
}
