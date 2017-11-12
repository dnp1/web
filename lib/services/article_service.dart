import 'dart:async';
import 'dart:convert';
import 'package:angular/angular.dart';

import 'package:danilo_info/model/article.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class ArticleService extends BaseHttpService {
  ArticleService(AuthClient http) : super(http);

  Future<String> readContent(String id) async {
    try {
      final resp = await http.get('/article/$id');
      final article = JSON.decode(resp.body)['content'];
      return article;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Article> read(String id) async {
    try {
      final resp = await http.get('/article/$id');
      final article = new Article.cachedFromJson(extractData(resp));
      return article;
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<Article>> list() async {
    try {
      final resp = await http.get('/article');
      return extractDataList(resp).map( //TODO:missing cache
              (element) => new Article.fromJson(element)).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<Article>> archive() async {
    try {
      final resp = await http.get('/article/archive');
      return extractDataList(resp).map( //TODO:missing cache
              (element) => new Article.fromJson(element)).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<List<String>> getTags(String articleId) async {
    try {
      final resp = await http.get('/article/$articleId/tag');
      return extractDataList(resp).map((data) => JSON.decode(data));
    } catch (e) {
      throw handleError(e);
    }
  }
}
