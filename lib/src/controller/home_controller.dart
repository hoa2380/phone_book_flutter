import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:phone_book_flutter/src/data/phone_book.dart';

class HomeController extends GetxController {
  final data = <PhoneBook>[].obs;

  getEmployees(Map<int, Map<String, dynamic>> phoneBookData) {
    phoneBookData.forEach((key, value) {
      data.add(PhoneBook(
          name: value["id"].toString(),
          phone: value["phone"].toString()));
    });
    print(phoneBookData[0]);
  }

  Future<void> uploadCsv() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['csv'],
      allowMultiple: false,
      withData: true,
      type: FileType.custom,
    );
    final bytes = utf8.decode((result!.files.first.bytes)!.toList());

    final tmp = const CsvToListConverter().convert(bytes);
    print(tmp);
    getEmployees(PhoneBook.userListToMap(tmp));
  }
}
