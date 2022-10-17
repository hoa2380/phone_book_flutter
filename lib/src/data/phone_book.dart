import 'dart:convert';

List<PhoneBook> phoneBookFromJson(String str) => List<PhoneBook>.from(json.decode(str).map((x) => PhoneBook.fromJson(x)));

String phoneBookToJson(List<PhoneBook> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PhoneBook {
  PhoneBook({
    required this.name,
    required this.phone,
  });

  String name;
  String phone;

  factory PhoneBook.fromJson(Map<String, dynamic> json) => PhoneBook(
    name: json["Name"],
    phone: json["Phone"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Phone": phone,
  };

  static Map<String, dynamic> phoneBookToMap(List<dynamic> row) {
    return {
      if (row[0] != null) 'Id': row[0],
      if (row[1] != null) 'Name': row[1],
    };
  }

  static Map<int, Map<String, dynamic>> userListToMap(
      List<List<dynamic>> userList) {
    // userList.removeAt(0);
    return userList.map((user) => phoneBookToMap(user)).toList().asMap();
  }
}