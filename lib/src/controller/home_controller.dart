import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:phone_book_flutter/src/data/phone_book.dart';

class HomeController extends GetxController {
  late var dataCsv = <PhoneBook>[].obs;
  late var dataFilter = [].obs;
  late Box<PhoneBook> phoneBookBox;
  // late var phoneBookData = [].obs;
  late var phoneBookData = <PhoneBook>[].obs;
  var isLoading = false.obs;
  late TextEditingController nameController;
  late TextEditingController phoneController;


  @override
  void onInit() {
    loadCSV();
    nameController = TextEditingController(text: "");
    phoneController = TextEditingController(text: "");
    super.onInit();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  void loadCSV() async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    var d = const FirstOccurrenceSettingsDetector(eols: ['\r\n', '\n']);
    final rawData = await rootBundle.loadString("assets/table_thanhtuu.csv");
    List<List<dynamic>> listData =
        CsvToListConverter(csvSettingsDetector: d).convert(rawData);
    listData.removeAt(0);
    for (var e in listData) {
      dataCsv.add(PhoneBook(
          id: int.parse(e[0]),
          idList: int.parse(e[1]),
          idItem: int.parse(e[2]),
          idCat: int.parse(e[3]),
          noibat: int.parse(e[4]),
          photo: e[5],
          thumb: e[6],
          ten: e[7],
          title: e[8],
          keywords: e[9],
          description: e[10],
          tenkhongdau: e[11],
          gia: e[12],
          dientich: e[13],
          mota: e[14],
          noidung: e[15],
          stt: e[16],
          hienthi: e[17],
          ngaytao: e[18],
          ngaysua: e[19],
          luotxem: e[20],
          mabn: e[21],
          diachi: e[22] ?? "",
          dienthoai: e[23],
          ngaysinh: e[24],
          gioitinh: e[25]));
    }
    if (phoneBookBox.isEmpty) {
      phoneBookBox.addAll(dataCsv);
    }
    phoneBookData.value = phoneBookBox.values.toList();
    isLoading.value = true;
  }

  Future<void> delete(index) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    phoneBookBox.deleteAt(index);
    phoneBookData.value = phoneBookBox.values.toList();
  }

  Future<void> edit(index, name, phone) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    var phoneBook = PhoneBook(
        id: 49,
        idList: 0,
        idItem: 0,
        idCat: 0,
        noibat: 0,
        photo: "",
        thumb: "",
        ten: name,
        title: "",
        keywords: "",
        description: "",
        tenkhongdau: "duong-thi-thuy-1964",
        gia: "0",
        dientich: "",
        mota: "",
        noidung: "",
        stt: "8",
        hienthi: "1",
        ngaytao: "1418892720",
        ngaysua: "1536166978",
        luotxem: "0",
        mabn: "08",
        diachi: "",
        dienthoai: phone,
        ngaysinh: "0000-00-00",
        gioitinh: "1");
    phoneBookBox.putAt(index, phoneBook);
    phoneBookData.value = phoneBookBox.values.toList();
  }

  Future<void> search(value) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    phoneBookData.value = phoneBookBox.values.where((e) => e.ten.toLowerCase().contains(value.toString().toLowerCase())).toList();
  }

  Future<void> add(name, phone) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    var phoneBook = PhoneBook(
        id: 49,
        idList: 0,
        idItem: 0,
        idCat: 0,
        noibat: 0,
        photo: "",
        thumb: "",
        ten: name,
        title: "",
        keywords: "",
        description: "",
        tenkhongdau: "duong-thi-thuy-1964",
        gia: "0",
        dientich: "",
        mota: "",
        noidung: "",
        stt: "8",
        hienthi: "1",
        ngaytao: "1418892720",
        ngaysua: "1536166978",
        luotxem: "0",
        mabn: "08",
        diachi: "",
        dienthoai: phone,
        ngaysinh: "0000-00-00",
        gioitinh: "1");
    phoneBookBox.add(phoneBook);
    phoneBookData.value = phoneBookBox.values.toList();
  }

  dialogEdit(index) {
    Get.defaultDialog(
        title: "Edit",
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black12
                      )
                  ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12
                    )
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if(nameController.text.isNotEmpty || phoneController.text.isNotEmpty) {
                    edit(index, nameController.text, phoneController.text);
                    nameController.clear();
                    phoneController.clear();
                  }
                  Get.back();
                },
                child: Text("Save"))
          ],
        ));
  }

  dialogAdd() {
    Get.defaultDialog(
        title: "Add",
        content: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.black12
                    )
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if(nameController.text.isNotEmpty || phoneController.text.isNotEmpty) {
                    add(nameController.text, phoneController.text);
                    nameController.clear();
                    phoneController.clear();
                  }
                  Get.back();
                },
                child: Text("Add"))
          ],
        ));
  }
}
