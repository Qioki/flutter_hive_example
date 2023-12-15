import 'package:flutter_hive_example/data/sources/category_datasource.dart';
import 'package:flutter_hive_example/domain/entity/category/category.dart';
import 'package:flutter_hive_example/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CategoryRepository)
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.localDataSource});

  final CategoryDatasource localDataSource;

  @override
  Future<List<Category>> getAll() async {
    return localDataSource.getAll();
  }

  @override
  Future<bool> add(Category item) {
    return localDataSource.add(item);
  }
}
