import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  Post(this.title, this.description);
}
