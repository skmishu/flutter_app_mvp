import 'data.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:zoombox_practice/json/serializers.dart';

class NewsDataRepoProc implements NewsRepository {
  final String URL = "https://zoombangla.com/api/index.php?task=selected_news";

  @override
  Future<List<NewsData>> fetchNewsData() async {
//    http.Response response = await http.get(URL_POST);
//    final List responseBody = converter.JsonDecoder as List;

    final response = await http.get((Uri.parse(URL)));

    print(response.body.toString());

    NewsData data = serializers.deserializeWith(
        NewsData.serializer, json.decode(response.body));
    return data.items.map((Data data) => data).toList();

    return null;
  }
}
