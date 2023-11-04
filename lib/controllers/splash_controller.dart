import 'dart:async';
import 'package:get/get.dart';
import 'package:todo/routes/app_pages.dart';


class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();

    Timer(const Duration(milliseconds: 2300), () async {
      Get.offNamed(RoutePath.home);
    });
  }
}
