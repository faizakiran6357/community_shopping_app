import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/list/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/scanner_screen/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/shopping/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavigationScreenLogic extends GetxController {
  RxInt selectedIndex = 0.obs;

  /// Bottom tabs pages
  final List<Widget> pages = [
     const HomeView(),   
     ListsScreen(),
     ScannerScreen(),
     ShoppingView()
       //HomeView(), 
           // 👈 index 0 (Your Home Page)
    // MoodLogView(),
    // ExportView(),
    // SettingsView(),
  ];

  /// Tab click handler
  void onItemTapped(int index) {
    // Same tab tap → pop to root
  //  Get.until((route) => route.isFirst, id: index);

    selectedIndex.value = index;
    onPageChanged(index);
  }

  /// Tab change callback (sir-level logic hook)
  void onPageChanged(int index) {
    switch (index) {
      case 0:
        print('Home opened');
        break;
      case 1:
        print('Mood Log opened');
        break;
      case 2:
        print('Export opened');
        break;
      case 3:
        print('Settings opened');
        break;
       case 4:
        print('Settings opened');
        break;
    }
  }


}
