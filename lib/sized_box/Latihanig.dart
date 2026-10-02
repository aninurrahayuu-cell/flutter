import 'package:flutter/material.dart';

class Latihanig extends StatelessWidget {

  // data story di atas
  final List storyUser = [
    'Your Story',
    'budi_rpl',
    'siti_xii',
    'andi_01',
    'dina_rpl',
    'rizky_88',
    'maya_a',
  ];

  // data feed instagram
  final List feedUser = [
    'budi_rpl',
    'siti_xii',
    'xii_rpl_1',
    'andi_01',
    'dina_rpl',
    'rizky_88',
    'maya_a',
    'smk_bisa',
    'agung_rpl',
    'dev_flutter',
  ];

  final List captions = [
    'Hore liburan telah tiba! 🏖️',
    'Tugas mobile dev selesai gaes #flutter',
    'Semangat kelas XII RPL 1 🔥',
    'Kopi siang ini terasa mantap ☕',
    'Coding seharian tapi seru 💻',
    'Weekend jalan-jalan bareng temen',
    'Projek baru Bismillah lancar',
    'Foto kenangan masa sekolah 📸',
    'Belajar layouting instagram di flutter',
    'Next project bikin UI ecommerce!',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. Tampilan Story di paling atas (Scroll Horizontal)
            Container(
              height: 100,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 0.5),
                ),
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyUser.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: index == 0 ? Colors.grey : Colors.pink,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundColor: Colors.grey[300],
                            child: Icon(Icons.person, color: Colors.grey[700]),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          storyUser[index],
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // 2. Feed Beranda IG (Scroll Vertical sampai 10 postingan)
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10, // 10 postingan feed
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Postingan (Foto profil + Nama akun)
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.grey[400],
                              child: Icon(Icons.person, size: 20, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Text(
                              feedUser[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),

                      // Gambar Postingan Feed
                      Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.blueGrey[(index % 5 + 2) * 100],
                        child: Center(
                          child: Icon(
                            Icons.image,
                            size: 80,
                            color: Colors.white60,
                          ),
                        ),
                      ),

                      // Tombol Aksi (Love, Message, Share, Favorite/Bookmark)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.chat_bubble_outline),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.send_outlined),
                              onPressed: () {},
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.bookmark_border),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      // Jumlah Likes
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '${(index + 1) * 12} likes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 4),

                      // Caption Postingan
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.black, fontSize: 13),
                            children: [
                              TextSpan(
                                text: '${feedUser[index]} ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: captions[index],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}