import 'package:flutter/material.dart';

class Latihan1ColumnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300,
        width: 200,
        color: Colors.lightGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
              image:DecorationImage(
              image: NetworkImage('https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png'), 
              fit: BoxFit.cover,
              ),
            ), 
            ),
            Column(children: [Text("Nama: Ani"), Text("Nis: 0099657195"), Text("Kelas: XII RPL 1")],)
          ]
        )
        
      ), 
    );
  }
}