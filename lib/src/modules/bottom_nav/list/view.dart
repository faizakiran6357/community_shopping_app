import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';


class ListView extends StatelessWidget {
  const ListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListLogic>(
      init: ListLogic(),
      builder: (logic) {
        return Obx(() {
          return Scaffold(
            body:Container()
          );
        });
      },
    );
  }
}
