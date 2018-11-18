import 'data.dart';

class NewsDataRepoMoc implements NewsRepository {
  @override
  Future<List<NewsData>> fetchNewsData() {
    return new Future.value(newsListMoc);
  }
}

var newsListMoc = <NewsData>[
  new NewsData(
    p_id: 1,
    post_title: "Hasina died",
    post_content: "hasinas dead body",
    img_src: "www.zoombox.com/hasina-deadbody",
  ),
  new NewsData(
      p_id: 2,
      post_title: "khaleda died",
      post_content: "khaleda died while pooping",
      img_src: "www.nationalparlament.com/schendal")
];
