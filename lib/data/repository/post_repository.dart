import 'package:flutter_hive_example/data/sources/post_datasource.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart';
import 'package:flutter_hive_example/domain/repository/post_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({required this.localDataSource});

  final PostDatasource localDataSource;

  @override
  Future<List<Post>> getAll(String category) async {
    return localDataSource.getAll(category);
  }

  @override
  Future<bool> add(String category, Post item) {
    return localDataSource.add(category, item);
  }

  @override
  Future<Post> getItem(String category, String post) {
    return localDataSource.getItem(category, post);
  }
}
