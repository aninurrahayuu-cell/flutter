import 'package:flutter/material.dart';

class Latihan3sls extends StatelessWidget{
  const Latihan3sls ({super.key});

  @override
  Widget build(BuildContext context){
    return Column(children: [Stack(clipBehavior: Clip.none,
    children: [
      Container(height: 120, color: Colors.amberAccent),
      Positioned(bottom: -30, left: 20, child: SizedBox(width: 80, height: 80, child: CircleAvatar(backgroundImage: NetworkImage("https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png"), radius: 36),),
      ),
    ],
    ),
    SizedBox(height: 40),
    Padding(padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(children: [Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Ani"), Text("XII RPL")],
    ),
    ),
    ],
    ),
    ),
    ElevatedButton(onPressed: (){}, child: Text("Follow")),
    ],
    );
  }
}