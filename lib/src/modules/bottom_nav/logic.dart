import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/list/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/profile/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/scanner_screen/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/shopping/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/list/view.dart';


class BottomNavigationScreenLogic extends GetxController {
  /// Selected tab index
  final RxInt selectedIndex = 0.obs;

  /// Bottom Navigation Pages
  final List<Widget> pages = [
     const HomeView(),   
     ListsScreen(),
     ScannerScreen(),
     ShoppingView(),
     ProfileNavView()
       //HomeView(), 
           // 👈 index 0 (Your Home Page)
    // MoodLogView(),
    // ExportView(),
    // SettingsView(),
  ];

  /// Tab click handler
  void onItemTapped(int index) {
    if (index >= pages.length) return; // 🛡 safety guard

    selectedIndex.value = index;
    onPageChanged(index);
  }

  /// Page change callback
  void onPageChanged(int index) {
    switch (index) {
      case 0:
        print('Home opened');
        break;
      case 1:
        print('Lists opened');
        break;
      case 2:
        print('Shopping opened');
        break;
      case 3:
        print('Profile opened');
        break;
      case 4:
        print('Profile opened');
        break;
    }
  }


}
