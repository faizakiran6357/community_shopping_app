import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizerExt on num {
  double get sp => this * (Get.width / 3) / 100;
  double get h => Get.height * (this / 100); // Relative height (percentage)
  double get w => Get.width * (this / 100);  // Relative width (percentage)
}
extension SizeBox on num
{

  SizedBox get height => SizedBox(height:toDouble());

  SizedBox get width => SizedBox(width:toDouble());

}