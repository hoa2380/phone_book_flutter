import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:phone_book_flutter/src/data/model/phone_book.dart';

class Api {
  var baseUrl = 'http://nhakhoatamphuoc.com/';
  var dio = Dio();

  Future<List<PhoneBook>> getPhoneBook(minId) async {
    var phoneBook = <PhoneBook>[];
    try {
      final response = await dio.get('${baseUrl}get_thanh_tuu.php?min_id=$minId');
      phoneBook = List.from(jsonDecode(response.data)).map((e) => PhoneBook.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.error);
    }
    return phoneBook;
  }
}