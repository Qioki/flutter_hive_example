import 'package:flutter_hive_example/domain/entity/post/post.dart' as model;

abstract class PostDatasource {
  Future<bool> initDb();
  Future<bool> add(String category, model.Post item);
  Future<List<model.Post>> getAll(String category);
  Future<model.Post> getItem(String category, String post);
}
