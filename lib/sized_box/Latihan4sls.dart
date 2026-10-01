import 'package:flutter/material.dart';

class Latihan4sls extends StatelessWidget {
  const Latihan4sls({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- KARTU PERTAMA (Kartu Profil Kuno/Sederhana) ---
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 216, 255, 44),
                const Color.fromARGB(255, 13, 4, 43),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
                
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png",
                      ),
                    ),
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
                  Spacer(),
                  Stack(
                    children: [
                      Icon(Icons.notifications, color: Colors.white, size: 28),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: BoxConstraints(
                            minWidth: 10,
                            minHeight: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

        // --- PEMBATAS / SPASI ---
        SizedBox(height: 10),
        Container(
          height: 100,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 216, 255, 44),
                const Color.fromARGB(255, 13, 4, 43),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ani Nur Rahayu",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "12 RPL 1",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    SizedBox(
                      width: 150,
                      height: 25,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 245, 245, 245),
                          foregroundColor: Colors.black,
                        ),
                        child: Text(
                          "Click Me",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}