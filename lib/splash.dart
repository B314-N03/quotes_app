import 'package:flutter/material.dart';
import 'package:quotes_app/daily_quote.dart';
import 'package:quotes_app/favourite.dart';
import 'functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quotes App',
      theme: ThemeData(),
      home: Quote(),
    );
  }
}

class Quote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 203, 203, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text.rich(TextSpan(
                    text: 'Have a Good Day!',
                    style: TextStyle(
                      fontFamily: 'Quattrocento',
                      fontSize: 36.0,
                    )))
              ],
            ),
            SizedBox(height: 80),
            ElevatedButton.icon(
              icon: Icon(
                Icons.auto_fix_high,
                color: Colors.black,
              ),
              label: Text('Get a new Daily Quote',
                  style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quo()));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(227, 60),
                primary: Colors.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(33.0),
                ),
              ),
            ),
            SizedBox(height: 30),
            Image.asset(
              'assets/images/Undraw_walking_outside_re_56xo1.png',
              width: 500,
              height: 250,
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                loadData();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QuoteFavo()));
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              label: Text(
                'List your favourite Quotes',
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(227, 60),
                primary: Colors.white,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(33.0),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

final quotes = [
  "The greatest glory in living\n lies not in never falling, but \nin rising every time we fall.\n -Nelson Mandela",
  "The way to get started is to quit talking and begin doing. \n -Walt Disney",
  "Love For All, Hatred For None. \n– Khalifatul Masih III",
  "Change the world by being yourself. \n – Amy Poehler",
  "Every moment is a fresh beginning.\n – T.S Eliot",
  "Never regret anything that made you smile.\n – Mark Twain",
  "Everything you can imagine is real.\n – Pablo Picasso",
  "Simplicity is the ultimate sophistication.\n – Leonardo da Vinci",
  "Whatever you do, do it well.\n – Walt Disney",
  "What we think, we become.\n – Buddha",
  "All limitations are self-imposed.\n – Oliver Wendell Holmes",
  "Tough times never last but tough people do.\n – Robert H. Schiuller",
  "If I’m gonna tell a real story, I’m gonna start with my name.\n – Kendrick Lamar",
  "Hate comes from intimidation, love comes from appreciation.\n – Tyga",
];
