import 'package:shared_preferences/shared_preferences.dart';
import 'functions.dart';
import 'package:flutter/material.dart';
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
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: SizedBox(
                    height: 500.0,
                    child: new ListView.builder(
                        itemCount: favoQuotesSaved.length,
                        itemBuilder: (BuildContext ctxt, index) {
                          return Card(
                            child: ListTile(
                              onTap: () {},
                              title: new Text(
                                favoQuotesSaved[index],
                                style: TextStyle(
                                    fontFamily: 'Quattrocento', fontSize: 20),
                              ),
                            ),
                          );
                        }),
                  ))
                ],
              ),
              SizedBox(height: 30),
              Favorite(),
            ],
          ),
        ));
  }
}

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  void saveData(String pQuote) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      favoQuotes.add(pQuote);
      prefs.setStringList('Quote', favoQuotes);
    });
  }

  //
  void saveData1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setStringList('Quote', favoQuotes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            deleteListContent(favoQuotes);
            saveData1();
          },
          icon: Icon(
            Icons.delete_forever,
            color: Colors.black,
          ),
          label: Text(
            "Delete Entire List",
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 50),
            primary: Colors.white,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(33.0),
            ),
          ),
        ),
      ],
    );
  }
}
