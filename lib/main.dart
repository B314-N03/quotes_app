import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/daily_quote.dart';
import 'package:quotes_app/favourite.dart';
import 'package:quotes_app/functions.dart';
import 'package:quotes_app/settings.dart';
import 'package:quotes_app/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      bottomNavigationBar: BottomNavyBar(
          animationDuration: Duration(milliseconds: 400),
          containerHeight: 60,
          selectedIndex: currentindex,
          curve: Curves.easeInOutQuint,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: Icon(CupertinoIcons.home),
              title: Text("Home"),
              inactiveColor: Colors.black,
              activeColor: Colors.blueAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(CupertinoIcons.quote_bubble),
              title: Text("Daily Quote"),
              inactiveColor: Colors.black,
              activeColor: Colors.blueAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(CupertinoIcons.square_favorites),
              title: Text("Favourites"),
              inactiveColor: Colors.black,
              activeColor: Colors.blueAccent,
            ),
            BottomNavyBarItem(
              icon: Icon(CupertinoIcons.settings),
              title: Text("Settings"),
              inactiveColor: Colors.black,
              activeColor: Colors.blueAccent,
            )
          ],
          onItemSelected: (index) {
            setState(() {
              currentindex = index;
            });
          }),
    );
  }
}
