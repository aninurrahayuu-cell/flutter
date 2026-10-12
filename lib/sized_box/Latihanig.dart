import 'package:flutter/material.dart';

class Latihanig extends StatelessWidget {
  // Data username untuk Story (total 10 akun sesuai permintaan)
  final List<String> storyUser = [
    'Your Story',
    'rahani.fen',
    'd1ilash',
    'avocad1lsh',
    'athvwa',
    'anggiouu',
    'riskauls',
    'zycheese',
    'nurra.yua',
    'whosgun_13',
    'dodolgarutt',
  ];

  // Data username untuk Feed
  final List<String> feedUser = [
    'rahani.fen',
    'd1ilash',
    'avocad1lsh',
    'athvwa',
    'anggiouu',
    'riskauls',
    'zycheese',
    'nurra.yua',
    'whosgun_13',
    'dodolgarutt',
  ];

  // URL Foto Profil yang bervariasi dari Unsplash
  final List<String> profileImages = [
    'https://png.pngtree.com/png-clipart/20240812/original/pngtree-cute-panda-standing-with-happy-expression-png-image_15762144.png',
    'https://png.pngtree.com/png-vector/20250523/ourmid/pngtree-single-delicate-white-flower-blossom-closeup-png-image_16293069.png',
    'https://png.pngtree.com/png-clipart/20241117/original/pngtree-blue-flower-png-image_17190083.png',
    'https://png.pngtree.com/png-vector/20250506/ourmid/pngtree-pink-flower-png-png-image_16153570.png',
    'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-mugunghwa-pink-flower-of-korea-png-png-image_11494956.png',
    'https://png.pngtree.com/png-vector/20250523/ourmid/pngtree-single-delicate-white-flower-blossom-closeup-png-image_16293069.png',
    'https://png.pngtree.com/png-clipart/20241117/original/pngtree-blue-flower-png-image_17190083.png',
    'https://png.pngtree.com/png-clipart/20250202/original/pngtree-blue-flower-bouquet-illustration-png-image_19853767.png',
    'https://png.pngtree.com/png-vector/20240913/ourmid/pngtree-violet-flowers-png-image_12922047.png',
    'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-mugunghwa-pink-flower-of-korea-png-png-image_11494956.png',
    'https://png.pngtree.com/png-clipart/20250202/original/pngtree-blue-flower-bouquet-illustration-png-image_19853767.png',
  ];

  // URL Foto Postingan Feed yang bervariasi dan estetik
  final List<String> postImages = [
    'https://png.pngtree.com/png-vector/20250523/ourmid/pngtree-single-delicate-white-flower-blossom-closeup-png-image_16293069.png',
    'https://png.pngtree.com/png-clipart/20241117/original/pngtree-blue-flower-png-image_17190083.png',
    'https://png.pngtree.com/png-vector/20250506/ourmid/pngtree-pink-flower-png-png-image_16153570.png',
    'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-mugunghwa-pink-flower-of-korea-png-png-image_11494956.png',
    'https://png.pngtree.com/png-vector/20250523/ourmid/pngtree-single-delicate-white-flower-blossom-closeup-png-image_16293069.png',
    'https://png.pngtree.com/png-clipart/20241117/original/pngtree-blue-flower-png-image_17190083.png',
    'https://png.pngtree.com/png-clipart/20250202/original/pngtree-blue-flower-bouquet-illustration-png-image_19853767.png',
    'https://png.pngtree.com/png-vector/20240913/ourmid/pngtree-violet-flowers-png-image_12922047.png',
    'https://png.pngtree.com/png-vector/20240125/ourmid/pngtree-mugunghwa-pink-flower-of-korea-png-png-image_11494956.png',
    'https://png.pngtree.com/png-clipart/20250202/original/pngtree-blue-flower-bouquet-illustration-png-image_19853767.png',
  ];

  final List<String> captions = [
    'cantikk',
    'indah',
    'wowww',
    'karya tuhan',
    'indah sekali',
    'nemu di taman',
    'oww kerennn',
    'baguss banget',
    'suka dehh',
    'MAHADAHSYATT',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        elevation: 0.5,
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
              height: 105,
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[200]!, width: 1),
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
                          padding: EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: index == 0 ? Colors.grey : Colors.pink,
                              width: 2.5,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(profileImages[index]),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          storyUser[index],
                          style: TextStyle(fontSize: 11, color: Colors.black87),
                          overflow: TextOverflow.ellipsis,
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Postingan (Foto profil + Nama akun)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(profileImages[index + 1]),
                            ),
                            SizedBox(width: 10),
                            Text(
                              feedUser[index],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Spacer(),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),

                      // Gambar Postingan Feed (Menggunakan gambar asli dari Unsplash)
                      Container(
                        height: 320,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(postImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // Tombol Aksi (Love, Message, Share, Bookmark)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite_border, size: 26),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.chat_bubble_outline, size: 24),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.send_outlined, size: 24),
                              onPressed: () {},
                            ),
                            Spacer(),
                            IconButton(
                              icon: Icon(Icons.bookmark_border, size: 26),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      // Jumlah Likes
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14),
                        child: Text(
                          '${(index + 1) * 15} likes',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
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