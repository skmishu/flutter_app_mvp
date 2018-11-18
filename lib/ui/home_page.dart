import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import '../modules/news_presentator.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> implements NewsListViewContract {
  NewsListPresenter _presenter;
  List<NewsData> _newsData;
  bool _isLoading;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _presenter = new NewsListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadNews();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("NewsData App"),
          elevation: defaultTargetPlatform == TargetPlatform.iOS ? 0.0 : 5.0,
        ),
        body: _isLoading
            ? new Center(
                child: new CircularProgressIndicator(),
              )
            : _cryptoWidget());
  }

  Widget _cryptoWidget() {
    return new Container(
        child: new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            itemCount: _newsData.length,
            itemBuilder: (BuildContext context, int index) {
              final int i = index ~/ 2;
              final NewsData news = _newsData[i];
              final MaterialColor color = _colors[i % _colors.length];
              if (index.isOdd) {
                return new Divider();
              }
//              return _getListItemUi(news, color);
              return _showListItemUI(news, color);
            },
          ),
        )
      ],
    ));
  }

  Card _showListItemUI(NewsData data, MaterialColor color) {
    return new Card(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
//          new Image.network(data.img_src,height: 100,),
          new Image.network(
            data.img_src,
            height: 100,
          ),
          Expanded(
            child: new Column(
              children: <Widget>[
                new Text(
                  data.post_title,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  data.p_id.toString(),
                  style: new TextStyle(fontWeight: FontWeight.normal),
                ),
                new Text(
                  data.post_content,
                  style: new TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<String> imageValidator(String rawImageLink) async {
    http.Response response = await http.get(rawImageLink);
    print("status Code: ${response.statusCode}  and   url:$rawImageLink");
    return rawImageLink;
  }

  ListTile _getListItemUi(NewsData news, MaterialColor color) {
    return new ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            new Image.network(
              "${news.img_src}",
              height: 50,
              width: 50,
            ),
          ],
        ),
      ),
      title: new Text(news.post_title,
          style: new TextStyle(fontWeight: FontWeight.bold)),
      subtitle: _getSubtitleText(news.post_content, news.p_id.toString()),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String postContent, String postID) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$postContent\n", style: new TextStyle(color: Colors.black));
    String postIDString = "$postID";
    TextSpan postChangeTextWidget;

    if (double.parse(postIDString) > 0) {
      postChangeTextWidget = new TextSpan(
          text: postIDString, style: new TextStyle(color: Colors.green));
    } else {
      postChangeTextWidget = new TextSpan(
          text: postIDString, style: new TextStyle(color: Colors.red));
    }

    return new RichText(
        text: new TextSpan(children: [priceTextWidget, postChangeTextWidget]));
  }

  @override
  void onLoadNewsComplete(List<NewsData> items) {
    // TODO: implement onLoadNewsComplete
    setState(() {
      _newsData = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadNewsError() {
    // TODO: implement onLoadNewsError
    print("error in home_page.dart line 109 (probable) ");
  }
}
