import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quotes_app/splash.dart';

List<String> favoQuotes = [];
List<String> favoQuotesSaved = [];

class Favo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Favourite Quotes',
      theme: ThemeData(),
      home: QuoteFavo(),
    );
  }
}

class QuoteFavo extends StatefulWidget {
  const QuoteFavo({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<QuoteFavo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(234, 203, 203, 1),
        body: Padding(
          padding: const EdgeInsets.symmetric(),
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
                    tooltip: 'Go back to the previous Page',
                    icon: Icon(Icons.backspace),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'Quattrocento',
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(),
                  Text(
                    'Favorite Quotes:',
                    style: TextStyle(
                        fontFamily: 'Quattrocento',
                        fontSize: 30.0,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(height: 100),
              ]),
            ],
          ),
        ));
  }
}

Future<List> loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favoQuotesSaved = prefs.getStringList("Favo") ?? [];
  return favoQuotesSaved;
}

void saveData(String pQuote) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favoQuotes.add(pQuote);
  prefs.setStringList('Quotes', favoQuotes);
  print(favoQuotes);
}

Widget _buildRow(String _randomQuote) {
  return ListTile(
    title: Text(
      _randomQuote,
      style:
          TextStyle(fontFamily: 'Quattrocento', fontSize: 20, wordSpacing: 1),
    ),
    trailing: Icon(
      Icons.favorite,
      color: Colors.red,
    ),
  );
}

Widget getContent() {
  int j = 0;
  for (int i = 0; i < favoQuotes.length + 1; i++) {
    j = j + 1;
  }
  return _buildRow(favoQuotes[j]);
}
