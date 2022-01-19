import 'package:quotes_app/quotes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favourite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String errorMsg = "";
bool error = false;

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

Future<Quotes> fetchQuotes() async {
  final response = await http.get(
      Uri.parse('https://api.quotable.io/random?minLength=40&maxLength=70'));

  if (response.statusCode == 200) {
    error = false;
    return Quotes.fromJson(jsonDecode(response.body));
  } else {
    errorMsg =
        "Something went Wrong... Check your internet connection and Try again!";
    throw Exception();
  }
}
