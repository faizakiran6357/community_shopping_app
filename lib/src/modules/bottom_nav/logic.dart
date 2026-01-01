// import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
// import 'package:community_shopping_app/src/modules/bottom_nav/list/view.dart';
// import 'package:community_shopping_app/src/modules/bottom_nav/profile/view.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';


// class BottomNavigationScreenLogic extends GetxController {
//   RxInt selectedIndex = 0.obs;

//   /// Bottom tabs pages
//   final List<Widget> pages = [
//      const HomeView(),   
//      ListsScreen(),
//      ProfileNavView()
//        //HomeView(), 
//            // 👈 index 0 (Your Home Page)
//     // MoodLogView(),
//     // ExportView(),
//     // SettingsView(),
//   ];

//   /// Tab click handler
//   void onItemTapped(int index) {
//     // Same tab tap → pop to root
//   //  Get.until((route) => route.isFirst, id: index);

//     selectedIndex.value = index;
//     onPageChanged(index);
//   }

//   /// Tab change callback (sir-level logic hook)
//   void onPageChanged(int index) {
//     switch (index) {
//       case 0:
//         print('Home opened');
//         break;
//       case 1:
//         print('Mood Log opened');
//         break;
//       case 2:
//         print('Export opened');
//         break;
//       case 3:
//         print('Settings opened');
//         break;
//     }
//   }
// }
import 'package:community_shopping_app/src/modules/bottom_nav/profile/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/list/view.dart';


class BottomNavigationScreenLogic extends GetxController {
  /// Selected tab index
  final RxInt selectedIndex = 0.obs;

  /// Bottom Navigation Pages
  /// ⚠️ IMPORTANT:
  /// Number of pages MUST match bottom nav items count
  // final List<Widget> pages = [
  //   const HomeView(),     // index 0 → Home
  //   ListsScreen(),        // index 1 → Lists
  //   //ShoppingView(),       // index 2 → Shopping
  //    ProfileNavView(), // index 3 → Profile
  // ];
  final List<Widget> pages = [
  const HomeView(),        // index 0 → Home
  ListsScreen(),           // index 1 → Lists
  Container(),             // index 2 → Center Scan (ya dummy)
  Container(),             // index 3 → Shopping (placeholder)
  ProfileNavView(),        // index 4 → Profile
];


  /// Bottom tab click handler
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
