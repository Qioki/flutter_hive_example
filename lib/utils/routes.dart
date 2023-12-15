import 'package:flutter/material.dart';
import 'package:flutter_hive_example/presentation/screens/post_list_screen.dart';
import 'package:flutter_hive_example/presentation/screens/home_screen.dart';
import 'package:flutter_hive_example/presentation/screens/post_detail_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  Routes._();

  static const String home = '/';

  static GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeScreen(),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) {
              return state.pathParameters['id'] == null
                  ? const Text('No data')
                  : PostListScreen(categoryName: state.pathParameters['id']!);
            },
            routes: [
              GoRoute(
                path: ':post',
                builder: (context, state) {
                  return state.pathParameters['id'] == null
                      ? const Text('No data')
                      : PostDetailScreen(
                          categoryName: state.pathParameters['id']!,
                          postName: state.pathParameters['post']!,
                        );
                },
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, state) {
      return null;
    },
  );
}
