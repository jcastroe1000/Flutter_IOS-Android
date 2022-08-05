import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'ed94b02917ae4b67a1f2aef31855cafd';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'Business'),
    Category(FontAwesomeIcons.tv, 'Entertainment'),
    Category(FontAwesomeIcons.book, 'General'),
    Category(FontAwesomeIcons.heart, 'Health'),
    Category(FontAwesomeIcons.atom, 'Science'),
    Category(FontAwesomeIcons.baseball, 'Dports'),
    Category(FontAwesomeIcons.laptop, 'Technology'),
  ];

  NewsService() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx');
    final resp = await http.get(url);
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    print(headlines);
    notifyListeners();
  }
}
