import 'package:flutter/material.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quotes_app/functions.dart';
import 'package:quotes_app/quotes_model.dart';
import 'package:quotes_app/favourite.dart';
import 'package:shared_preferences/shared_preferences.dart';

late String _randomQuote;
late String _randomQuoteAuthor;
bool _isFavo = false;

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
  late Future<Quotes> futureQuotes;

  @override
  void initState() {
    super.initState();
    futureQuotes = fetchQuotes();
    _isFavo = false;
  }

  // ignore: non_constant_identifier_namesg
  void saveData(String pQuote, String pAuthor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (pQuote == "1") {
      favoQuotes.remove(pQuote);
      prefs.setStringList('Quote', favoQuotes);
    } else
      setState(() {
        favoQuotes.add(pQuote);
        prefs.setStringList('Quote', favoQuotes);
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
                SizedBox(height: 110),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 317,
                  height: 180,
                  child: Row(
                    children: [
                      Center(
                        child: LimitedBox(
                          maxWidth: 317,
                          child: Center(
                            child: FutureBuilder<Quotes>(
                                future: futureQuotes,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    _randomQuote = snapshot.data!.content;
                                    _randomQuoteAuthor = snapshot.data!.author;
                                    return Column(
                                      children: [
                                        Text(
                                          '$_randomQuote',
                                          maxLines: 4,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Quattrocento',
                                              fontSize: 26),
                                        ),
                                        SizedBox(height: 15),
                                        Text(
                                          '-$_randomQuoteAuthor',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Quattrocento',
                                              fontSize: 26),
                                        ),
                                      ],
                                    );
                                  } else if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Text(
                                      '$errorMsg',
                                      maxLines: 4,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'Quattrocento',
                                          fontSize: 26),
                                    );
                                  }
                                  return Transform.scale(
                                    scale: 0.5,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 7,
                                      color: Colors.black,
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _isFavo = true;
                    if (favoQuotes.contains(_randomQuote)) {
                      _isFavo = true;
                    } else {
                      saveData(_randomQuote, _randomQuoteAuthor);
                      _showToast(context);
                    }
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                  label: Text(
                      _isFavo ? 'Remove from favourite' : 'Add To favourite',
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
            SizedBox(height: 60),
            Image.asset(
              'assets/images/Sitting_by_tree.png',
              width: 400,
              height: 280,
            )
          ],
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            favoQuotes.remove(_randomQuote);
            scaffold.hideCurrentSnackBar();
          }),
    ),
  );
}
