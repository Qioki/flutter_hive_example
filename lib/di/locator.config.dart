// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_hive_example/data/repository/category_repository.dart'
    as _i6;
import 'package:flutter_hive_example/data/repository/post_repository.dart'
    as _i10;
import 'package:flutter_hive_example/data/sources/category_datasource.dart'
    as _i3;
import 'package:flutter_hive_example/data/sources/local/hive/categories/category_datasource.dart'
    as _i4;
import 'package:flutter_hive_example/data/sources/local/hive/posts/post_datasource.dart'
    as _i8;
import 'package:flutter_hive_example/data/sources/post_datasource.dart' as _i7;
import 'package:flutter_hive_example/domain/repository/category_repository.dart'
    as _i5;
import 'package:flutter_hive_example/domain/repository/post_repository.dart'
    as _i9;
import 'package:flutter_hive_example/presentation/cubits/category/category_cubit.dart'
    as _i11;
import 'package:flutter_hive_example/presentation/cubits/post/post_cubit.dart'
    as _i12;
import 'package:flutter_hive_example/presentation/cubits/post_detail/post_detail_cubit.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    await gh.lazySingletonAsync<_i3.CategoryDatasource>(
      () {
        final i = _i4.CategoryDatasourceHiveImpl();
        return i.initDb().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i5.CategoryRepository>(() => _i6.CategoryRepositoryImpl(
        localDataSource: gh<_i3.CategoryDatasource>()));
    await gh.lazySingletonAsync<_i7.PostDatasource>(
      () {
        final i = _i8.PostDatasourceHiveImpl();
        return i.initDb().then((_) => i);
      },
      preResolve: true,
    );
    gh.lazySingleton<_i9.PostRepository>(() =>
        _i10.PostRepositoryImpl(localDataSource: gh<_i7.PostDatasource>()));
    gh.factory<_i11.CategoryCubit>(
        () => _i11.CategoryCubit(gh<_i5.CategoryRepository>()));
    gh.factory<_i12.PostCubit>(() => _i12.PostCubit(gh<_i9.PostRepository>()));
    gh.factory<_i13.PostDetailCubit>(
        () => _i13.PostDetailCubit(gh<_i9.PostRepository>()));
    return this;
  }
}
