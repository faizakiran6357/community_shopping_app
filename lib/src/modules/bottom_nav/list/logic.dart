import 'package:get/get.dart';


class ListLogic extends GetxController {
RxString userName = 'Thomas'.obs;


/// Example list (later API se ayegi)
RxList<String> shoppingLists = <String>[].obs;


@override
void onInit() {
super.onInit();
// yahan future me API call hogi
}


void onAddList() {
print('Add list tapped');
}


void onSeeAll() {
print('See all tapped');
}
}