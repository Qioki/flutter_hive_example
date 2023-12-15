import 'dart:async';
import 'package:flutter_hive_example/data/sources/local/hive/posts/post.dart';
import 'package:flutter_hive_example/data/sources/post_datasource.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart' as model;
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(
  as: PostDatasource,
)
class PostDatasourceHiveImpl implements PostDatasource {
  @PostConstruct(preResolve: true)
  @override
  Future<bool> initDb() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);
      Hive.registerAdapter(PostAdapter());
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<model.Post>> getAll(String category) async {
    if (!Hive.isBoxOpen(category)) {
      await Hive.openBox<Post>(category);
    }
    final box = Hive.box<Post>(category);
    return box.values.map<model.Post>((e) {
      return model.Post(e.title, e.description);
    }).toList();
  }

  @override
  Future<bool> add(String category, model.Post item) async {
    try {
      if (!Hive.isBoxOpen(category)) {
        await Hive.openBox<Post>(category);
      }
      final box = Hive.box<Post>(category);
      await box.put(item.title, Post(item.title, item.description));
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<model.Post> getItem(String category, String post) async {
    if (!Hive.isBoxOpen(category)) {
      await Hive.openBox<Post>(category);
    }
    final box = Hive.box<Post>(category);
    var postHive = box.get(post);
    if (postHive == null) {
      return model.Post('', '');
    }
    return model.Post(postHive.title, postHive.description);
  }
}
