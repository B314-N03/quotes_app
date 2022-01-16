import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favourite.dart';
import 'package:http/http.dart';

Future<List<String>> loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favoQuotesSaved = prefs.getStringList('Quote') ?? [];
  print(favoQuotesSaved);
  return favoQuotesSaved;
}

void deleteListContent(List<dynamic> pList) {
  favoQuotes.clear();
  favoQuotesSaved.clear();
}
