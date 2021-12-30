import 'package:shared_preferences/shared_preferences.dart';
import 'favourite.dart';

Future<List<String>> loadData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  favoQuotesSaved = prefs.getStringList('Quote') ?? [];
  return favoQuotesSaved;
}

void printData(List li) {
  for (var i = 0; i < li.length; i++) {
    var currentElement = li[i];
    print(currentElement);
  }
}

void deleteListContent(List<dynamic> pList) {
  favoQuotes.clear();
  favoQuotesSaved.clear();
  var result = "List" + pList.toString() + "has been deleted";
}
