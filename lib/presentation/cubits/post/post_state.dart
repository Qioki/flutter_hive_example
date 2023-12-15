part of 'post_cubit.dart';

@freezed
class PostState with _$PostState {
  const factory PostState.initial() = _Initial;
  const factory PostState.success(List<Post> items) = _Success;
}
