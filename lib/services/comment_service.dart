import 'dart:async';

import 'dart:convert';
import 'package:angular/angular.dart';
import 'package:danilo_info/model/comment.dart';
import 'package:danilo_info/services/base_http_service.dart';
import 'package:danilo_info/util/auth_client.dart';

@Injectable()
class CommentService extends BaseHttpService {
  CommentService(AuthClient http) : super(http);

  Future<List<Comment>> list(String articleId) async {
    try {
      final resp = await http.get(urlPrefix + '/article/$articleId/comment');
      return extractDataList(resp).map((e) => new Comment.cachedFromJson(e)).toList();
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Comment> read(String articleId, String commentId) async {
    try {
      final resp = await http.get(urlPrefix + '/article/$articleId/comment/$commentId');
      return new Comment.cachedFromJson(extractData(resp));
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<String> readContent(String articleId, String commentId) async {
    try {
      final resp = await http.get(urlPrefix + '/article/$articleId/comment/$commentId/content');
      return extractData(resp)['content'];
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<Null> save(String articleId, Comment comment, String content) async {
    try {
      await http.post(urlPrefix + "/article/$articleId/comment", body: JSON.encode(comment));
    } catch(e) {
      throw handleError(e);
    }
  }
}
