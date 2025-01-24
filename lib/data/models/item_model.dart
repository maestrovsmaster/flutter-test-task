class ItemModel {
  final String id;
  final String name;
  final String imageUrl;
  final int count;
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
