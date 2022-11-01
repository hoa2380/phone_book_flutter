import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  String label;
  TextEditingController textCtrl;
  TextInputType? textInputType = TextInputType.text;
  // String? initValue = " ";

  TextInput({required this.label, required this.textCtrl, this.textInputType});

  @override
  Widget build(BuildContext context) {
   return TextFormField(
     // onChanged: (v) {
     //   textCtrl.text = initValue!;
     // },
     // initialValue: initValue,
     controller: textCtrl,
     keyboardType: textInputType,
     decoration: InputDecoration(
       labelText: label,
       border: OutlineInputBorder(
           borderSide: BorderSide(
               color: Colors.black12
           )
       ),
     ),
   );
  }

}