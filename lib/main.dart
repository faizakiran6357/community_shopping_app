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
      title: 'community shopping app',

      // ===============================
      // THEMES
      // ===============================
      theme: ThemeCollection.lightTheme,
      darkTheme: ThemeCollection.darkTheme,
      themeMode: ThemeMode.system,

      // ===============================
      // INITIAL SCREEN
      // ===============================
      home: const SplashView(),
    );
  }
}
