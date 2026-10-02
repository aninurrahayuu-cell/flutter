import 'package:flutter/material.dart';
import 'container/ContainerSatu.dart';
import 'container/LatihanContainer.dart';
import 'row_column/RowWidget.dart';
import 'row_column/ColumnWidget.dart';
import 'row_column/RowColumnWidget.dart';
import 'row_column/Latihan1Columnwidget.dart';
import 'sized_box/SizedBoxWidget.dart';
import 'sized_box/ExpendedWidget.dart';
import 'sized_box/StackWidget.dart';
import 'sized_box/LayoutSatu.dart';
import 'sized_box/LayoutDua.dart';
import 'sized_box/Latihan2sls.dart';
import 'sized_box/Latihan3sls.dart';
import 'sized_box/Latihan4sls.dart';
import 'sized_box/Latihanig.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Latihan Container Ani"),
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
        ),
     body: Latihanig(),
      ),
    );
  }
}

class HelloWidget extends StatelessWidget {
  const new({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
     child: Text("Hello Flutter", 
     style:  TextStyle(
       fontSize: 24,
       fontWeight: FontWeight.bold,
       color: Colors.blue,
     ) ,),
    );
  }
}