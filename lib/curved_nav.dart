import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/daily_quote.dart';
import 'package:quotes_app/favourite.dart';
import 'package:quotes_app/settings.dart';
import 'package:quotes_app/splash.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentindex = 0;

  List<Widget> widgetlist = [
    Splash(),
    Quo(),
    Favo(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetlist[currentindex],
      bottomNavigationBar: CurvedNavigationBar(
        items: <Widget>[
          Icon(CupertinoIcons.home),
          Icon(CupertinoIcons.quote_bubble),
          Icon(CupertinoIcons.square_favorites),
          Icon(CupertinoIcons.settings)
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
        height: 55.0,
        animationCurve: Curves.easeInOutQuad,
        animationDuration: Duration(milliseconds: 500),
        backgroundColor: Colors.blueAccent,
        buttonBackgroundColor: Colors.white,
      ),
    );
  }
}
