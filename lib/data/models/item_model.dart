import 'package:hive/hive.dart';

import 'history_event.dart';
import 'tasting_notes.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? imageUrl;

  @HiveField(3)
  final int? count;

  @HiveField(4)
  final int? total;

  @HiveField(5)
  final int? year;

  @HiveField(6)
  final int? batchNumber;

  @HiveField(7)
  final String? distillery;

  @HiveField(8)
  final String? region;

  @HiveField(9)
  final String? country;

  @HiveField(10)
  final String? type;

  @HiveField(11)
  final String? ageStatement;

  @HiveField(12)
  final String? filled;

  @HiveField(13)
  final String? bottled;

  @HiveField(14)
  final String? caskNumber;

  @HiveField(15)
  final double? abv;

  @HiveField(16)
  final String? size;

  @HiveField(17)
  final String? finish;

  @HiveField(18)
  final String? videoUrl;

  @HiveField(19)
  final TastingNotes? officialNotes;

  @HiveField(20)
  final TastingNotes? userNotes;

  @HiveField(21)
  final List<HistoryEvent>? history;

  ItemModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.count,
    required this.total,
    required this.year,
    required this.batchNumber,
    this.distillery,
    this.region,
    this.country,
    this.type,
    this.ageStatement,
    this.filled,
    this.bottled,
    this.caskNumber,
    this.abv,
    this.size,
    this.finish,
    this.videoUrl,
    this.officialNotes,
    this.userNotes,
    this.history,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      throw Exception("Missing required field: id");
    }
    if (json['name'] == null) {
      throw Exception("Missing required field: name");
    }
    return ItemModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      count: json['count'],
      total: json['total'],
      year: json['year'],
      batchNumber: json['batchNumber'],
      distillery: json['distillery'],
      region: json['region'],
      country: json['country'],
      type: json['type'],
      ageStatement: json['ageStatement'],
      filled: json['filled'],
      bottled: json['bottled'],
      caskNumber: json['caskNumber'],
      abv: json['abv'],
      size: json['size'],
      finish: json['finish'],
      videoUrl: json['videoUrl'],
      officialNotes: json['officialNotes'] != null
          ? TastingNotes.fromJson(Map<String, dynamic>.from(json['officialNotes']))
          : null,
      userNotes: json['userNotes'] != null
          ? TastingNotes.fromJson(Map<String, dynamic>.from(json['userNotes']))
          : null,
      history: json['history'] != null
          ? (json['history'] as List<dynamic>?)
              ?.map((e) => HistoryEvent.fromJson(Map<String, dynamic>.from(e)))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'count': count,
      'total': total,
      'year': year,
      'batchNumber': batchNumber,
      'distillery': distillery,
      'region': region,
      'country': country,
      'type': type,
      'ageStatement': ageStatement,
      'filled': filled,
      'bottled': bottled,
      'caskNumber': caskNumber,
      'abv': abv,
      'size': size,
      'finish': finish,
      'videoUrl': videoUrl,
      'officialNotes': officialNotes?.toJson(),
      'userNotes': userNotes?.toJson(),
      'history': history?.map((e) => e.toJson()).toList(),
    };
  }
}
