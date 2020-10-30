import 'dart:convert';
import 'article_model.dart';
import 'package:http/http.dart' as http;
class News {

  List<ArticleModel> news = [];
  String _country;
  News(String country){
    if(country == 'USA'){
      this._country = 'us';
    }
    else if (country == 'UK') {
      this._country = 'gb';
    }
    else{
      this._country = country;
    }
  }

  Future<void> getNews() async {

    String url = 'http://newsapi.org/v2/top-headlines?country=${_country.toLowerCase()}&category=health&apiKey=6d4c71b6a4ae41be8ae81f036123af2b';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
              publishedAt: element['publishedAt']
          );

          news.add(articleModel);
        }
      });
    }
  }


}