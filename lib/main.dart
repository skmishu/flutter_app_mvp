import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_mvp/dependency/dependency_injection.dart';
import 'package:flutter_app_mvp/ui/home_page.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS
              ? Colors.grey[100]
              : null),
      home: new HomePage(),
    );
  }
}

//    print("printing json data ${NewsDataRepoProc().fetchNewsData()}");
