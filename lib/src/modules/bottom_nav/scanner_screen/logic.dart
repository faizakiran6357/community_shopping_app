import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerLogic extends GetxController {
  late final MobileScannerController scannerController;

  bool isScanning = true;
  String scannedCode = '';
  String productName = '';
  String productImage = '';

  @override
  void onInit() {
    super.onInit();

    scannerController = MobileScannerController(
      detectionSpeed: DetectionSpeed.noDuplicates,
      facing: CameraFacing.back,
    );
  }

  void onBarcodeDetected(BarcodeCapture capture) {
    if (!isScanning) return;

    final barcode = capture.barcodes.first;
    final code = barcode.rawValue;

    if (code == null) return;

    isScanning = false;

    scannedCode = code;
    productName = "Orange Juice";
    productImage = "assets/images/orangeBottle.png";

    update();

    /// ⏱ Delay then allow next scan
    Future.delayed(const Duration(seconds: 3), () {
      isScanning = true;
      scannedCode = '';
      productName = '';
      productImage = '';
      update();
    });
  }

  @override
  void onClose() {
    scannerController.dispose();
    super.onClose();
  }
}
