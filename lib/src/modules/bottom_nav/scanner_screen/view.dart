import 'package:community_shopping_app/src/modules/bottom_nav/scanner_screen/logic.dart';
import 'package:community_shopping_app/src/modules/bottom_nav/scanner_screen/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:get/get.dart';
import 'package:community_shopping_app/src/widgets/custom_top_bar.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ScannerLogic>(
      init: ScannerLogic(),
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              /// 🔝 TOP BAR
              CustomTopBar(
                title: 'Scanner',
                titleColor: Colors.white,
                drawerIconColor: Colors.white,
              ),

              /// 📷 CAMERA AREA
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// CAMERA (DO NOT COVER IT)
                    MobileScanner(
                      key: const ValueKey('scanner'),
                      controller: logic.scannerController,
                      onDetect: logic.onBarcodeDetected,
                    ),

                    /// SCAN CORNERS ONLY
                     _ScanOverlay(),

                    /// PRODUCT CARD
                    if (logic.scannedCode.isNotEmpty)
                      Positioned(
                        bottom: 20,
                        left: 16,
                        right: 16,
                        child: ScannedProductCard(logic: logic),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class _ScanOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Container(
          width: 260,
          height: 260,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: CustomPaint(
            painter: _CornerPainter(),
          ),
        ),
      ),
    );
  }
}

class _CornerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const corner = 28.0;

    // top-left
    canvas.drawLine(const Offset(0, corner), const Offset(0, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(corner, 0), paint);

    // top-right
    canvas.drawLine(Offset(size.width - corner, 0), Offset(size.width, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, corner), paint);

    // bottom-left
    canvas.drawLine(Offset(0, size.height - corner), Offset(0, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(corner, size.height), paint);

    // bottom-right
    canvas.drawLine(
        Offset(size.width - corner, size.height),
        Offset(size.width, size.height),
        paint);
    canvas.drawLine(
        Offset(size.width, size.height - corner),
        Offset(size.width, size.height),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


