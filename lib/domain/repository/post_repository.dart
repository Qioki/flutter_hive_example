import 'package:flutter_hive_example/domain/entity/post/post.dart';

abstract class PostRepository {
  Future<List<Post>> getAll(String category);
  Future<Post> getItem(String category, String post);
  Future<bool> add(String category, Post item);
}
