import 'package:community_shopping_app/src/modules/bottom_nav/home/view.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/view.dart';
import 'package:community_shopping_app/src/modules/splash/splash_view.dart';
import 'package:community_shopping_app/src/utils/theme_collection.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);

        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(
              mediaQuery.textScaleFactor.clamp(1.0, 1.1),
            ),
          ),
          child: child!,
        );
      },
      // ===============================
      // INITIAL SCREEN
      // ===============================
      home: const BottomNavigationScreen(),
    );
  }
}
