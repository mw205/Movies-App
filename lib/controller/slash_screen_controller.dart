import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 2, milliseconds: 600), () {
      Get.offAllNamed("/Home");
    });

    super.onReady();
  }
}
