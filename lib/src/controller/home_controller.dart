import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:phone_book_flutter/src/data/api/api.dart';
import 'package:phone_book_flutter/src/data/model/phone_book.dart';
import 'package:phone_book_flutter/src/widget/text_input.dart';
import 'package:tiengviet/tiengviet.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  late var data = <PhoneBook>[].obs;
  late var dataFilter = [].obs;
  late Box<PhoneBook> phoneBookBox;
  // late var phoneBookData = [].obs;
  late var phoneBookData = <PhoneBook>[].obs;
  var isLoading = false.obs;
  late TextEditingController tenCrtl;
  late TextEditingController sttCrtl;
  late TextEditingController mabnCrtl;
  late TextEditingController dienthoaiCrtl;

  var ngaysinh = "Chọn ngày sinh".obs;
  var gioitinh = "Nam".obs;

  @override
  void onInit() {
    loadData();
    tenCrtl = TextEditingController(text: "");
    sttCrtl = TextEditingController(text: "");
    mabnCrtl = TextEditingController(text: "");
    dienthoaiCrtl = TextEditingController(text: "");
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
      for (var i = 0; i <= 15; i++) {
        data.value = await Api().getPhoneBook(data[data.length - 1].id);
        phoneBookBox.addAll(data);
      }
    } else {
      data.value = await Api().getPhoneBook(
          phoneBookBox.values.toList()[phoneBookBox.length - 1].id);
      if (data.isNotEmpty) {
        phoneBookBox.addAll(data);
      }
    }
    phoneBookData.value = phoneBookBox.values.toList();
    isLoading.value = true;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (d != null) {
      ngaysinh.value = DateFormat("yyyy-MM-dd").format(d);
    }
  }

  List<DropdownMenuItem<String>> get genderItem {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: "Nam", child: Text("Nam")),
      DropdownMenuItem(value: "Nữ", child: Text("Nữ")),
    ];
    return menuItems;
  }

  Future<void> delete(index) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    phoneBookBox.deleteAt(index);
    phoneBookData.value = phoneBookBox.values.toList();
  }

  Future<void> edit(index, name, phone) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    // var phoneBook = PhoneBook(
    //     id: "49",
    //     idList: "0",
    //     idItem: "0",
    //     idCat: "0",
    //     noibat: "0",
    //     photo: "",
    //     thumb: "",
    //     ten: name,
    //     title: "",
    //     keywords: "",
    //     description: "",
    //     tenkhongdau: "duong-thi-thuy-1964",
    //     gia: "0",
    //     dientich: "",
    //     mota: "",
    //     noidung: "",
    //     stt: "8",
    //     hienthi: "1",
    //     ngaytao: "1418892720",
    //     ngaysua: "1536166978",
    //     luotxem: "0",
    //     mabn: "08",
    //     diachi: "",
    //     dienthoai: phone,
    //     ngaysinh: "0000-00-00",
    //     gioitinh: "1");
    // phoneBookBox.putAt(index, phoneBook);
    // phoneBookData.value = phoneBookBox.values.toList();
  }

  Future<void> search(value) async {
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    phoneBookData.value = phoneBookBox.values
        .where((e) => TiengViet.parse(e.ten.toLowerCase())
            .contains(TiengViet.parse(value.toString().toLowerCase())))
        .toList();
  }

  dialogEdit(index, id, ten, dienthoai, stt, mabn, ngays, gioit, ngaytao) {
    ngaysinh.value = ngays;
    tenCrtl.text = ten;
    dienthoaiCrtl.text = dienthoai;
    sttCrtl.text = stt.toString();
    mabnCrtl.text = mabn;
    if (gioit == 1) {
      gioitinh.value = "Nam";
    } else {
      gioitinh.value = "Nữ";
    }
    phoneBookBox = Hive.box<PhoneBook>('phoneBookData');
    Get.defaultDialog(
        title: "Sửa",
        content: Column(
          children: [
            TextInput(
              // initValue: ten,
              label: "Tên",
              textCtrl: tenCrtl,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              // initValue: dienthoai,
              label: "Số điện thoại",
              textCtrl: dienthoaiCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              // initValue: stt.toString(),
              label: "STT",
              textCtrl: sttCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              // initValue: mabn,
              label: "Mã Bệnh Nhân ",
              textCtrl: mabnCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.3, color: Colors.black),
                    left: BorderSide(width: 0.3, color: Colors.black),
                    right: BorderSide(width: 0.3, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Obx(
                      () => InkWell(
                        child: Text(ngaysinh.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black)),
                        onTap: () {
                          selectDate(Get.context!);
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        selectDate(Get.context!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.3, color: Colors.black),
                    left: BorderSide(width: 0.3, color: Colors.black),
                    right: BorderSide(width: 0.3, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Chọn giới tính: "),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => DropdownButton(
                          value: gioitinh.value,
                          items: genderItem,
                          onChanged: (value) {
                            gioitinh.value = value!;
                            print(gioitinh.value);
                          }),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool result = await InternetConnectionChecker().hasConnection;
                  if (result == true) {
                    if (tenCrtl.text.isNotEmpty ||
                        dienthoaiCrtl.text.isNotEmpty ||
                        sttCrtl.text.isNotEmpty ||
                        mabnCrtl.text.isNotEmpty ||
                        ngaysinh.value != "Chọn ngày sinh") {
                      try {
                        phoneBookBox.putAt(
                            index,
                            PhoneBook(
                                id: id,
                                idList: 1,
                                idItem: 1,
                                idCat: 1,
                                noibat: 1,
                                photo: " ",
                                thumb: " ",
                                ten: ten,
                                title: " ",
                                keywords: " ",
                                description: " ",
                                tenkhongdau: " ",
                                gia: 0,
                                dientich: " ",
                                mota: " ",
                                noidung: " ",
                                stt: stt,
                                hienthi: 1,
                                ngaytao: ngaytao,
                                ngaysua: DateTime.now().millisecondsSinceEpoch,
                                luotxem: 0,
                                mabn: mabn,
                                diachi: " ",
                                dienthoai: dienthoai,
                                ngaysinh: ngays,
                                gioitinh: gioit));
                        phoneBookData.value = phoneBookBox.values.toList();
                        print(phoneBookBox.values.toList()[0]);
                      } catch (e) {
                        print(e);
                      }
                      await Api().updatePhoneBook(
                          id,
                          tenCrtl.text,
                          sttCrtl.text,
                          mabnCrtl.text,
                          dienthoaiCrtl.text,
                          ngaysinh.value,
                          gioitinh.value);
                      Get.back();
                      dialog("Sửa thành công", "");
                      clearText();
                    } else {
                      dialog("Sửa thất bại", "Thông tin không chính xác");
                    }
                  } else {
                    dialog("Sửa thất bại", "Vui lòng kết nối internet");
                  }
                },
                child: Text("Sửa"))
          ],
        ));
  }

  dialogAdd() {
    Get.defaultDialog(
        title: "Thêm",
        content: Column(
          children: [
            TextInput(
              label: "Tên",
              textCtrl: tenCrtl,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "Số điện thoại",
              textCtrl: dienthoaiCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "STT",
              textCtrl: sttCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            TextInput(
              label: "Mã Bệnh Nhân ",
              textCtrl: mabnCrtl,
              textInputType: TextInputType.number,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.3, color: Colors.black),
                    left: BorderSide(width: 0.3, color: Colors.black),
                    right: BorderSide(width: 0.3, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Obx(
                      () => InkWell(
                        child: Text(ngaysinh.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black)),
                        onTap: () {
                          selectDate(Get.context!);
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      onPressed: () {
                        selectDate(Get.context!);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.3, color: Colors.black),
                    left: BorderSide(width: 0.3, color: Colors.black),
                    right: BorderSide(width: 0.3, color: Colors.black),
                    bottom: BorderSide(width: 0.3, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text("Chọn giới tính: "),
                    SizedBox(
                      width: 10,
                    ),
                    Obx(
                      () => DropdownButton(
                          value: gioitinh.value,
                          items: genderItem,
                          onChanged: (value) {
                            gioitinh.value = value!;
                            print(gioitinh.value);
                          }),
                    )
                  ],
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool result = await InternetConnectionChecker().hasConnection;
                  if (result == true) {
                    if (tenCrtl.text.isNotEmpty ||
                        dienthoaiCrtl.text.isNotEmpty ||
                        sttCrtl.text.isNotEmpty ||
                        mabnCrtl.text.isNotEmpty ||
                        ngaysinh.value != "Chọn ngày sinh") {
                      await Api().addPhoneBook(
                          tenCrtl.text,
                          sttCrtl.text,
                          mabnCrtl.text,
                          dienthoaiCrtl.text,
                          ngaysinh.value,
                          gioitinh.value);
                      Get.back();
                      dialog("Thêm thành công", "");
                      clearText();
                    } else {
                      dialog("Thêm thất bại", "Điền đầy đủ thông tin");
                    }
                  } else {
                    dialog("Thêm thất bại", "Vui lòng kết nối internet");
                  }
                },
                child: Text("Thêm"))
          ],
        ));
  }

  clearText() {
    tenCrtl.clear();
    dienthoaiCrtl.clear();
    sttCrtl.clear();
    mabnCrtl.clear();
    ngaysinh.value = "Chọn ngày sinh";
  }

  dialog(title, msg) {
    Get.defaultDialog(
        title: title,
        content: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black)),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok"))
          ],
        ));
  }
}
