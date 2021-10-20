import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/example_exceptions.dart';
import 'package:newsapp/model/article_model.dart';

class ApiService {
  final client = http.Client();
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=1332ab69b5d84e6a8f3ea889f780e092";

  Future<List<Article>> getArticle() async {
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List list = jsonData["articles"];
        return list.map((article) => Article.fromJson(article)).toList();
      }
      throw EmptyResponseException();
    } catch (e) {
      throw ServerException();
    }
  }
}
