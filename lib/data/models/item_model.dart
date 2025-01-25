import 'package:hive/hive.dart';
part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String imageUrl;

  @HiveField(3)
  final int count;

  @HiveField(4)
  final int total;

  ItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.count,
    required this.total,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      count: json['count'],
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'count': count,
      'total': total,
    };
  }
}
