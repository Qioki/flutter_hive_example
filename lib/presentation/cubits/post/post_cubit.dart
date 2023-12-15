import 'package:bloc/bloc.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart';
import 'package:flutter_hive_example/domain/repository/post_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_state.dart';
part 'post_cubit.freezed.dart';

@injectable
class PostCubit extends Cubit<PostState> {
  final PostRepository postRepository;
  PostCubit(this.postRepository) : super(const PostState.initial());

  Future<void> getItems(String categoryName) async {
    emit(PostState.success(await postRepository.getAll(categoryName)));
  }

  Future<void> newPost(String categoryName, Post post) async {
    await postRepository.add(categoryName, post);
    await getItems(categoryName);
  }
}
