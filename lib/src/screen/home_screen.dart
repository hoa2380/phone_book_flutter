import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_book_flutter/src/controller/home_controller.dart';

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
              icon: Icon(Icons.import_contacts)
          ),
        ]
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Search',
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(
                            color: Theme.of(context).primaryColor
                        )
                    ),
                    prefixIcon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor
                    )
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Name $index'),
                        subtitle: Text('Phone $index'),
                      );
                    }
                )
            )
          ],
        ),
      ),
    );
  }
}
