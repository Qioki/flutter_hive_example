import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hive_example/presentation/cubits/post_detail/post_detail_cubit.dart';

class PostDetailScreen extends StatelessWidget {
  const PostDetailScreen({
    super.key,
    required this.categoryName,
    required this.postName,
  });

  final String categoryName;
  final String postName;

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<PostDetailCubit>();
    var post = cubit.getItem(categoryName, postName);

    return FutureBuilder(
      future: post,
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${snapshot.data?.title}'),
          ),
          body: snapshot.hasData
              ? Container(
                  padding: EdgeInsets.all(20),
                  child: Text('${snapshot.data!.description}'),
                )
              : Text('No data'),
        );
      },
    );
  }
}
