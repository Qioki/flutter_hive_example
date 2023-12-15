import 'package:flutter_hive_example/domain/entity/category/category.dart'
    as model;

abstract class CategoryDatasource {
  Future<bool> initDb();
  Future<bool> add(model.Category item);
  Future<List<model.Category>> getAll();
}
