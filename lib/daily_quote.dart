import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:quotes_app/splash.dart';
import 'package:quotes_app/favourite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Quote',
      theme: ThemeData(),
      home: DailyQuote(),
    );
  }
}

class DailyQuote extends StatefulWidget {
  const DailyQuote({Key? key}) : super(key: key);
  @override
  _DailyQuoteState createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote> {
  // ignore: non_constant_identifier_names
  final _randomQuote = randomChoice(quotes);
  void saveData(String pQuote) {
    setState(() async {
      favoQuotes.add(pQuote);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('FavoQuotes', favoQuotes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 203, 203, 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 100),
                IconButton(
                    iconSize: 30.0,
                    alignment: Alignment.topLeft,
                    tooltip: 'Go back to the previous Page!',
                    icon: Icon(Icons.backspace),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    }),
                SizedBox(width: 10),
                Text("Back",
                    style: TextStyle(fontFamily: 'Quattrocento', fontSize: 24)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 317,
                  height: 200,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 317,
                        height: 100,
                        child: Text(
                          '$_randomQuote',
                          style: TextStyle(
                            fontFamily: 'Quattrocento',
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    saveData(_randomQuote);
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  label: Text('Add To favourite',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Prompt',
                          fontSize: 13)),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(180, 47),
                      primary: Colors.white,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(33.0))),
                ),
              ],
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/Sitting_by_tree.png',
              width: 400,
              height: 310,
            )
          ],
        ),
      ),
    );
  }
}
