import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(adapterName: 'CategoryAdapter', typeId: 0)
class Category extends HiveObject {
  @HiveField(0)
  String title;

  Category(this.title);
}
