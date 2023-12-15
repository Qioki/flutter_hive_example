import 'package:bloc/bloc.dart';
import 'package:flutter_hive_example/domain/entity/post/post.dart';
import 'package:flutter_hive_example/domain/repository/post_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'post_detail_state.dart';
part 'post_detail_cubit.freezed.dart';

@injectable
class PostDetailCubit extends Cubit<PostDetailState> {
  final PostRepository postRepository;
  PostDetailCubit(this.postRepository) : super(const PostDetailState.initial());

  Future<Post> getItem(String categoryName, String postName) async {
    var post = await postRepository.getItem(categoryName, postName);
    emit(PostDetailState.success(post));
    return post;
  }
}
