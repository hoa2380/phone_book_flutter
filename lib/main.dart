import 'package:get/get.dart';
import 'package:phone_book_flutter/src/binding/home_binding.dart';
import 'package:phone_book_flutter/src/controller/home_controller.dart';
import 'package:phone_book_flutter/src/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  Get.put<HomeController>(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: HomeBinding(),
      home: const HomeScreen(),
    );
  }
}
