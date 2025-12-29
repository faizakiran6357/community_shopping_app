import 'package:get/get.dart';

class HomeLogic extends GetxController {
  RxString userName = 'Thomas'.obs;

  
  RxList<String> shoppingLists = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
   
  }

  void onAddList() {
    print('Add list tapped');
  }

  void onSeeAll() {
    print('See all tapped');
  }
}
