import '../data/data.dart';
import 'package:flutter_app_mvp/dependency/dependency_injection.dart';

abstract class NewsListViewContract {
  void onLoadNewsComplete(List<NewsData> items);

  void onLoadNewsError();
}

class NewsListPresenter {
  NewsListViewContract _view;
  NewsRepository _repository;

  NewsListPresenter(this._view) {
    _repository = new Injector().newsRepository;
  }

  void loadNews() {
    _repository
        .fetchNewsData()
        .then((c) => _view.onLoadNewsComplete(c))
        .catchError((onError) => _view.onLoadNewsError());
  }
}
