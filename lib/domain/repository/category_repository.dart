import 'package:flutter_hive_example/domain/entity/category/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAll();
  Future<bool> add(Category item);
}
