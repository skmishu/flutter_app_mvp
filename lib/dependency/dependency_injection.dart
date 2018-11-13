import 'data/data.dart';
import 'data/news_data_repo_proc.dart';
import 'data/news_data_repo_moc.dart';

enum Flavor { MOCK, PROD }

//DI
class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  NewsRepository get newsRepository {
    switch (_flavor) {
      case Flavor.MOCK:
        return new NewsDataRepoMoc();
      default:
        return new NewsDataRepoProc();
    }
  }
}
