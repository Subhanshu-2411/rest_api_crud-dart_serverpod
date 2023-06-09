import 'package:serverpod/serverpod.dart';

import '../generated/article_class.dart';

class ArtikoolEndpoint extends Endpoint {
  Future<List<Article>> getArticles(Session session, {String? keyword}) async {
    return await Article.find(
      session,
      where: (t) => keyword != null ? t.title.like('%keyword%') : Constant(true),
    );
  }

  Future<bool> addArticle(Session session, Article article) async {
    Article.insert(session, article);
    return true;
  }

  Future<bool> updateArticle(Session session, Article article) async {
    return await Article.update(session, article);
  }

  Future<bool> deleteArticle(Session session, int id) async {
    return await Article.delete(session, where: (t) => t.id.equals(id)) == 1;
  }
}