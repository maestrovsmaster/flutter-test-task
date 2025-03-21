import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'history_event.dart';
import 'tasting_notes.dart';

part 'item_model.g.dart';

//Command for generating Hive models: flutter pub run build_runner build

@HiveType(typeId: 0)
class ItemModel extends HiveObject with EquatableMixin {
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

  @HiveField(22)
  final bool isDetailed;

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
    this.isDetailed = false,
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
          ? TastingNotes.fromJson(
              Map<String, dynamic>.from(json['officialNotes']))
          : null,
      userNotes: json['userNotes'] != null
          ? TastingNotes.fromJson(Map<String, dynamic>.from(json['userNotes']))
          : null,
      history: json['history'] != null
          ? (json['history'] as List<dynamic>?)
              ?.map((e) => HistoryEvent.fromJson(Map<String, dynamic>.from(e)))
              .toList()
          : null,
      isDetailed: json['isDetailed'] ?? false,
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
      'isDetailed': isDetailed
    };
  }

  ItemModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    int? count,
    int? total,
    int? year,
    int? batchNumber,
    String? distillery,
    String? region,
    String? country,
    String? type,
    String? ageStatement,
    String? filled,
    String? bottled,
    String? caskNumber,
    double? abv,
    String? size,
    String? finish,
    String? videoUrl,
    TastingNotes? officialNotes,
    TastingNotes? userNotes,
    List<HistoryEvent>? history,
    bool? isDetailed,
  }) {
    return ItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      count: count ?? this.count,
      total: total ?? this.total,
      year: year ?? this.year,
      batchNumber: batchNumber ?? this.batchNumber,
      distillery: distillery ?? this.distillery,
      region: region ?? this.region,
      country: country ?? this.country,
      type: type ?? this.type,
      ageStatement: ageStatement ?? this.ageStatement,
      filled: filled ?? this.filled,
      bottled: bottled ?? this.bottled,
      caskNumber: caskNumber ?? this.caskNumber,
      abv: abv ?? this.abv,
      size: size ?? this.size,
      finish: finish ?? this.finish,
      videoUrl: videoUrl ?? this.videoUrl,
      officialNotes: officialNotes ?? this.officialNotes,
      userNotes: userNotes ?? this.userNotes,
      history: history != null
          ? history.map((event) => event.copyWith()).toList()
          : this.history,
      isDetailed: isDetailed ?? this.isDetailed,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        count,
        total,
        year,
        batchNumber,
        distillery,
        region,
        country,
        type,
        ageStatement,
        filled,
        bottled,
        caskNumber,
        abv,
        size,
        finish,
        videoUrl,
        officialNotes,
        userNotes,
        history,
        isDetailed
      ];
}
