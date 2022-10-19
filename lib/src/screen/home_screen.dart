import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:phone_book_flutter/src/controller/home_controller.dart';
import 'dart:math' as math;

import 'package:phone_book_flutter/src/screen/detail_screen.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Book'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_call)
          ),
        ]
      ),
      body: GetX<HomeController> (
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    print(value);
                    controller.search(value);
                  },
                  decoration: InputDecoration(
                      labelText: 'Search',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColor
                          )
                      ),
                      prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).primaryColor
                      )
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(
                    child: controller.isLoading.value
                        ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.phoneBookData.length,
                        itemBuilder: (context, index) {
                          var item = controller.phoneBookData[index];
                          return Slidable(
                              startActionPane:  ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (value) {
                                      // controller.delete(index);
                                    },
                                    backgroundColor: Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (value) {
                                      // controller.dialogEdit(index);
                                    },
                                    backgroundColor: Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  onTap: () {
                                    Get.to(() => DetailScreen(name: item.ten, phone: item.dienthoai));
                                  },
                                  title: Text(item.ten),
                                  subtitle: Text(item.id),
                                  leading:  Container(
                                      width: 40,
                                      height: 40,
                                      decoration:  BoxDecoration(
                                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(item.ten.substring(0, 1).toUpperCase()),
                                      )
                                  ),
                                ),
                              )
                          );
                        }
                    )
                        : Center(child: CircularProgressIndicator(),)
                )
              ],
            ),
          );
        },
      )
    );
  }
}
