/*
* @NewsData
    this class will contain a model class where variable of properties will written.

* @NewsRepository
    this is an abstract class which will be implemented from various class as they required. it will return a list of data model of @NewsData.

* @FetchDataException
    this is a class where Exception will be handled during data retrieve from several network calls
    this will return two @Override method like => onFetchDataComplete() and onFetchDataFail()


 */

import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class NewsData {
  int p_id;
  String post_content, post_title, img_src;

  NewsData({this.p_id, this.post_title, this.post_content, this.img_src});

  factory NewsData.fromJson(Map<String, dynamic> json) =>
      _$NewsDataFromJson(json);

  factory NewsData.fromJson2(Map<String, dynamic> json) {
    return new NewsData(
        p_id: json['p_id'],
        post_title: json['post_title'].toString(),
        post_content: json['post_content'].toString(),
        img_src: json['img_src'].toString());
  }

  NewsData.fromMap(Map<String, dynamic> map)
      : p_id = map['p_id'],
        post_title = map['post_title'],
        post_content = map['post_content'],
        img_src = map['img_src'].toString();
}

abstract class NewsRepository {
  Future<List<NewsData>> fetchNewsData();
}

class FetchDataException implements Exception {
  final _message;

  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return "Exception caught: $_message";
  }
}
