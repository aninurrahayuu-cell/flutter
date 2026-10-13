import 'package:flutter/material.dart';

class ListBasic extends StatelessWidget {
  const ListBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('kembali'),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          width: 200,
          color: Colors.amber,
          child: Text("1"),
        )
      ],
    );
  }
}