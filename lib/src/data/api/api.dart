import 'package:dio/dio.dart';
import 'package:phone_book_flutter/src/data/model/phone_book.dart';

class Api {
  var baseUrl = 'http://kyniema4.hopto.org:3001/api/';
  var dio = Dio();

  Future<List<PhoneBook>> getPhoneBook(minId) async {
    var phoneBook = <PhoneBook>[];
    try {
      final response = await dio.get('${baseUrl}achievements?last_id=$minId');
      phoneBook = List.from(response.data["data"]).map((e) => PhoneBook.fromJson(e)).toList();
    } on DioError catch (e) {
      print(e.error);
    }
    return phoneBook;
  }
  
  addPhoneBook(ten, stt, mabn, dienthoai, ngaysinh, gioitinh) async {
    Map<String, dynamic> body = {
      "id_list": 1,
      "id_item": 1,
      "id_cat": 1,
      "noibat": 1,
      "photo": " ",
      "thumb": " ",
      "ten": ten,
      "title": " ",
      "keywords": " ",
      "description": " ",
      "tenkhongdau": " ",
      "gia": 0,
      "dientich": " ",
      "mota": " ",
      "noidung": " ",
      "stt": stt,
      "hienthi": 1,
      "ngaysua": 0,
      "ngaytao": DateTime.now().millisecondsSinceEpoch,
      "mabn": mabn,
      "luotxem": 0,
      "diachi": " ",
      "dienthoai": dienthoai,
      "ngaysinh": ngaysinh,
      "gioitinh": gioitinh == "Nam" ? 1 : 0,
    };
    print(body);
    try {
      await dio.post('${baseUrl}achievements', data: body);
    } on DioError catch (e) {
      print(e);
    }
  }

  updatePhoneBook(id, ten, stt, mabn, dienthoai, ngaysinh, gioitinh) async {
    Map<String, dynamic> body = {
      "id_list": 0,
      "id_item": 0,
      "id_cat": 0,
      "noibat": 0,
      "photo": " ",
      "thumb": " ",
      "ten": ten,
      "title": " ",
      "keywords": " ",
      "description": " ",
      "tenkhongdau": " ",
      "gia": 0,
      "dientich": " ",
      "mota": " ",
      "noidung": " ",
      "stt": stt,
      "hienthi": 1,
      "ngaysua": DateTime.now().millisecondsSinceEpoch,
      "mabn": mabn,
      "luotxem": 0,
      "diachi": " ",
      "dienthoai": dienthoai,
      "ngaysinh": ngaysinh,
      "gioitinh": gioitinh == "Name" ? 1 : 0
    };
    try {
      await dio.put('${baseUrl}achievements/$id', data: body);
    } on DioError catch (e) {
      print(e);
    }
  }
}