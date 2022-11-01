import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailScreen extends StatefulWidget {
  final String name;
  final String mabn;


  DetailScreen({required this.name, required this.mabn});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(''),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.call)
              ),
            ]
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration:  BoxDecoration(
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(widget.name.substring(0, 1).toUpperCase(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      )
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Tên Bệnh Nhân: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(widget.name, style: TextStyle(fontSize: 20) )
                    ],
                  ),
                  Row(
                    children: [
                      Text('Mã Bệnh Nhân: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      Text(widget.mabn, style: TextStyle(fontSize: 20))
                    ],
                  )
                ],
              )

            ],
          ),
        ),
    );
  }
}
