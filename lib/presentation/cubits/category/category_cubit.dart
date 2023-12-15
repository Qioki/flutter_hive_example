import 'package:bloc/bloc.dart';
import 'package:flutter_hive_example/domain/entity/category/category.dart';
import 'package:flutter_hive_example/domain/repository/category_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_state.dart';
part 'category_cubit.freezed.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository)
      : super(const CategoryState.initial()) {
    getItems();
  }

  Future<void> getItems() async {
    emit(CategoryState.success(await categoryRepository.getAll()));
  }

  Future<void> newCategory(String title) async {
    await categoryRepository.add(Category(title));
    await getItems();
  }
}
