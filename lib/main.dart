import 'package:flutter/material.dart';
import 'container/ContainerSatu.dart';
import 'container/LatihanContainer.dart';
import 'row_column/RowWidget.dart';
import 'row_column/ColumnWidget.dart';
import 'row_column/RowColumnWidget.dart';
import 'row_column/Latihan1Columnwidget.dart';
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
          backgroundColor: Colors.amber,
          centerTitle: true,
        ),
     body: Latihan1ColumnWidget(),
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