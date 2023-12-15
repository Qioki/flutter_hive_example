import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart';
import 'package:flutter_hive_example/presentation/cubits/post/post_cubit.dart';
import 'package:flutter_hive_example/presentation/screens/post_form.dart';
import 'package:go_router/go_router.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key, required this.categoryName});

  final String categoryName;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PostCubit>();
    cubit.getItems(categoryName);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) => state.when(
            initial: () => const Text('No data'),
            success: (List<Post> items) => ListView.builder(
                itemCount: items.length,
                itemBuilder: (c, i) {
                  return InkWell(
                    onTap: () {
                      context.go('/$categoryName/${items[i].title}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(items[i].title),
                    ),
                  );
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await modalNewPost(context);
          if (result != null) {
            await cubit.newPost(categoryName, result);
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
