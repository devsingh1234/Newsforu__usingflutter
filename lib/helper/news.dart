import 'dart:convert';

import 'package:myapp/models/article_model.dart';
import 'package:http/http.dart' as http;

class news{
  List<ArticleModel> newss = [];
  Future<void>getNews() async{
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=421b301931c9466d8ee33249ac0b07ba");

    var response = await http.get(url);

    var JsonData = jsonDecode(response.body);

    if(JsonData['status'] == "ok"){
      JsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articlemodel = ArticleModel(
            title: element['title'],
            Author: element['author'],
            discr: element['description'],
            urltoImage: element['urlToImage'],
            publshedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],

          );
          newss.add(articlemodel);
        }

      });

    }

  }
}