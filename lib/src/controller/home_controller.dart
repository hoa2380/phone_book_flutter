import 'package:csv/csv.dart';
import 'package:csv/csv_settings_autodetection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:phone_book_flutter/src/data/api/api.dart';
import 'package:phone_book_flutter/src/data/model/phone_book.dart';

class HomeController extends GetxController {
  late var data = <PhoneBook>[].obs;
  late var dataFilter = [].obs;
  late Box<PhoneBook> phoneBookBox;
  // late var phoneBookData = [].obs;
  late var phoneBookData = <PhoneBook>[].obs;
  var isLoading = false.obs;
  late TextEditingController nameController;
  late TextEditingController phoneController;


  @override
  void onInit() {
    loadData();
    nameController = TextEditingController(text: "");
    phoneController = TextEditingController(text: "");
    super.onInit();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  void loadData() async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    if (phoneBookBox.isEmpty) {
      data.value = await Api().getPhoneBook(-1);
      phoneBookBox.addAll(data);
    } else {
      data.value = await Api().getPhoneBook(phoneBookBox.values.toList()[phoneBookBox.length - 1].id);
      if(data.isNotEmpty) {
        phoneBookBox.addAll(data);
      }
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
        id: "49",
        idList: "0",
        idItem: "0",
        idCat: "0",
        noibat: "0",
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

}
