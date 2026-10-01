import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
      height: 72,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(132, 165, 157, 1.0),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 6,
          ),
        ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: CircleAvatar(backgroundImage: NetworkImage("https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png")),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ani Nur Rahayu"),
                    SizedBox(height: 4),
                    Text("Kelas XII RPL 1"),
                  ],
                ),
              ),
        ],
      ),
      )
    );
  }
}