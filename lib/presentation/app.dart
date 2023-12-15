import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hive_example/di/locator.dart';
import 'package:flutter_hive_example/presentation/cubits/category/category_cubit.dart';
import 'package:flutter_hive_example/presentation/cubits/post/post_cubit.dart';
import 'package:flutter_hive_example/presentation/cubits/post_detail/post_detail_cubit.dart';
import 'package:flutter_hive_example/utils/routes.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<CategoryCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<PostCubit>(),
        ),
        BlocProvider(
          create: (context) => locator<PostDetailCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: Routes.router,
      ),
    );
  }
}
