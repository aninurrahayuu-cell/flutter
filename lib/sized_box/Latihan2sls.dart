import 'package:flutter/material.dart';

class Latihan2sls extends StatelessWidget{
  const Latihan2sls ({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Row(children: [Expanded(child: Container(height: 80, color: Colors.lightBlue, alignment: Alignment.center, child: Text("Pemasukan"),
    ),
    ),
    SizedBox(width: 10),
    Expanded(child: Container(height: 80, color: Colors.pinkAccent, alignment: Alignment.center, child: Text("Pengeluaran"),
    ),
    ),
    SizedBox(width: 10),
    Positioned(top: 10,left: 10, right: 10, child: Text(""),
    ),
    Expanded(child: Container(height: 80, color: Colors.lightGreen, alignment: Alignment.center, child: Text("Saldo"),
    ),
    ),
    ],
    ),
    );
    }
  }
