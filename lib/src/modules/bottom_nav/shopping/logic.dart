import 'package:community_shopping_app/src/modules/bottom_nav/shopping/models/shopping_model.dart';
import 'package:get/get.dart';


class ShoppingLogic extends GetxController {
 final shoppingLists = [
    ShoppingModel(title: 'Grocery List', totalProducts: 20),
    ShoppingModel(title: 'Dinner Party List', totalProducts: 20),
    ShoppingModel(title: 'Grocery List', totalProducts: 20),
  ];
}