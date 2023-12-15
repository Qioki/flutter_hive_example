import 'dart:async';
import 'package:flutter_hive_example/data/sources/category_datasource.dart';
import 'package:flutter_hive_example/data/sources/local/hive/categories/category.dart';
import 'package:flutter_hive_example/domain/entity/category/category.dart'
    as model;
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@LazySingleton(as: CategoryDatasource)
class CategoryDatasourceHiveImpl implements CategoryDatasource {
  final _boxName = 'categories';

  @PostConstruct(preResolve: true)
  @override
  Future<bool> initDb() async {
    try {
      final appDocumentDir = await getApplicationDocumentsDirectory();
      Hive.init(appDocumentDir.path);

      Hive.registerAdapter(CategoryAdapter());
      await Hive.openBox<Category>(_boxName);
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<model.Category>> getAll() async {
    final box = Hive.box<Category>(_boxName);
    return box.values.map<model.Category>((e) {
      return model.Category(e.title);
    }).toList();
  }

  @override
  Future<bool> add(model.Category item) async {
    try {
      final box = Hive.box<Category>(_boxName);
      await box.add(Category(item.title));
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
