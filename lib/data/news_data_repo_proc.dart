import 'data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class NewsDataRepoProc implements NewsRepository {
  final String URL = "https://zoombangla.com/api/index.php?task=selected_news";
  Map data;
  List userDataList;

  @override
  Future<List<NewsData>> fetchNewsData() async {
    http.Response response = await http.get(URL);
    data = json.decode(response.body);
    userDataList = data["items"];

    List<NewsData> newsList =
        userDataList.map((c) => new NewsData.fromMap(c)).toList();

    print("totalNews: ${newsList.length} ");
    for (int i = 0; i < userDataList.length; i++) {
      print(
          "p_id: ${newsList.elementAt(i).p_id} \n imgUrl: ${newsList.elementAt(i).img_src}");
    }

    return newsList;
  }
}
