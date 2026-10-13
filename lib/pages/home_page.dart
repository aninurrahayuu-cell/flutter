import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/about');
              },
              child: Text('Masuk Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/grid-product-page');
              },
              child: Text('Masuk List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/article-detail-screen');
              },
              child: Text('Masuk Detail'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/article-list-screen');
              },
              child: Text('Masuk List Screen'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/column-widget');
              },
              child: Text('Masuk Column'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row-column-widget');
              },
              child: Text('Masuk Row Column'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/row-widget');
              },
              child: Text('Masuk Row'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/expended-widget');
              },
              child: Text('Masuk Expanded'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sizedbox-widget');
              },
              child: Text('Masuk Sizedbox'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/stack-widget');
              },
              child: Text('Masuk Stack'),
            ),
          ],
        ),
      ),
    );
  }
}