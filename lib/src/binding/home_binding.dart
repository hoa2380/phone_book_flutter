import 'package:get/get.dart';
import 'package:phone_book_flutter/src/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
