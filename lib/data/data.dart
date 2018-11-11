/*
* @NewsData
    this class will contain a model class where variable of properties will written.

* @NewsRepository
    this is an abstract class which will be implemented from various class as they required. it will return a list of data model of @NewsData.

* @FetchDataException
    this is a class where Exception will be handled during data retrieve from several network calls
    this will return two @Override method like => onFetchDataComplete() and onFetchDataFail()


 */

class NewsData {
  String p_id, post_content, post_title, img_src;

  NewsData({this.p_id, this.post_title, this.post_content, this.img_src});
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
