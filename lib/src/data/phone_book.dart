// import 'dart:convert';

// List<PhoneBook> phoneBookFromJson(String str) => List<PhoneBook>.from(json.decode(str).map((x) => PhoneBook.fromJson(x)));
//
// String phoneBookToJson(List<PhoneBook> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

import 'package:hive/hive.dart';

part 'phone_book.g.dart';

@HiveType(typeId: 0)
class PhoneBook {
  PhoneBook({
    required this.id,
    required this.idList,
    required this.idItem,
    required this.idCat,
    required this.noibat,
    required this.photo,
    required this.thumb,
    required this.ten,
    required this.title,
    required this.keywords,
    required this.description,
    required this.tenkhongdau,
    required this.gia,
    required this.dientich,
    required this.mota,
    required this.noidung,
    required this.stt,
    required this.hienthi,
    required this.ngaytao,
    required this.ngaysua,
    required this.luotxem,
    required this.mabn,
    required this.diachi,
    required this.dienthoai,
    required this.ngaysinh,
    required this.gioitinh,
  });

  @HiveField(0)
  int id;
  @HiveField(1)
  int idList;
  @HiveField(2)
  int idItem;
  @HiveField(3)
  int idCat;
  @HiveField(4)
  int noibat;
  @HiveField(5)
  String photo;
  @HiveField(6)
  String thumb;
  @HiveField(7)
  String ten;
  @HiveField(8)
  String title;
  @HiveField(9)
  String keywords;
  @HiveField(10)
  String description;
  @HiveField(11)
  String tenkhongdau;
  @HiveField(12)
  String gia;
  @HiveField(13)
  String dientich;
  @HiveField(14)
  String mota;
  @HiveField(15)
  String noidung;
  @HiveField(16)
  String stt;
  @HiveField(17)
  String hienthi;
  @HiveField(19)
  String ngaytao;
  @HiveField(20)
  String ngaysua;
  @HiveField(21)
  String luotxem;
  @HiveField(22)
  String mabn;
  @HiveField(23)
  String diachi;
  @HiveField(24)
  String dienthoai;
  @HiveField(25)
  String ngaysinh;
  @HiveField(26)
  String gioitinh;

  @override
  String toString() {
    return 'PhoneBook{id: $id, idList: $idList, idItem: $idItem, idCat: $idCat, noibat: $noibat, photo: $photo, thumb: $thumb, ten: $ten, title: $title, keywords: $keywords, description: $description, tenkhongdau: $tenkhongdau, gia: $gia, dientich: $dientich, mota: $mota, noidung: $noidung, stt: $stt, hienthi: $hienthi, ngaytao: $ngaytao, ngaysua: $ngaysua, luotxem: $luotxem, mabn: $mabn, diachi: $diachi, dienthoai: $dienthoai, ngaysinh: $ngaysinh, gioitinh: $gioitinh}';
  }

// factory PhoneBook.fromJson(Map<String, dynamic> json) => PhoneBook(
  //   id: json["id"],
  //   idList: json["id_list"],
  //   idItem: json["id_item"],
  //   idCat: json["id_cat"],
  //   noibat: json["noibat"],
  //   photo: json["photo"],
  //   thumb: json["thumb"],
  //   ten: json["ten"],
  //   title: json["title"],
  //   keywords: json["keywords"],
  //   description: json["description"],
  //   tenkhongdau: json["tenkhongdau"],
  //   gia: json["gia"],
  //   dientich: json["dientich"],
  //   mota: json["mota"],
  //   noidung: json["noidung"],
  //   stt: json["stt"],
  //   hienthi: json["hienthi"],
  //   ngaytao: json["ngaytao"],
  //   ngaysua: json["ngaysua"],
  //   luotxem: json["luotxem"],
  //   mabn: json["mabn"],
  //   diachi: json["diachi"],
  //   dienthoai: json["dienthoai"],
  //   ngaysinh: json["ngaysinh"],
  //   gioitinh: json["gioitinh"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "id_list": idList,
  //   "id_item": idItem,
  //   "id_cat": idCat,
  //   "noibat": noibat,
  //   "photo": photo,
  //   "thumb": thumb,
  //   "ten": ten,
  //   "title": title,
  //   "keywords": keywords,
  //   "description": description,
  //   "tenkhongdau": tenkhongdau,
  //   "gia": gia,
  //   "dientich": dientich,
  //   "mota": mota,
  //   "noidung": noidung,
  //   "stt": stt,
  //   "hienthi": hienthi,
  //   "ngaytao": ngaytao,
  //   "ngaysua": ngaysua,
  //   "luotxem": luotxem,
  //   "mabn": mabn,
  //   "diachi": diachi,
  //   "dienthoai": dienthoai,
  //   "ngaysinh": ngaysinh,
  //   "gioitinh": gioitinh,
  // };

}
