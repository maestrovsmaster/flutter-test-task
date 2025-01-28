import 'package:hive_flutter/adapters.dart';

part 'tasting_notes.g.dart';

//Command for generating Hive models: flutter pub run build_runner build

@HiveType(typeId: 3)
class TastingNotes extends HiveObject {
  @HiveField(0)
  final String nose;

  @HiveField(1)
  final String palate;

  @HiveField(2)
  final String finish;


  TastingNotes({
    required this.nose,
    required this.palate,
    required this.finish,
  });

  factory TastingNotes.fromJson(Map<String, dynamic> json) {
    return TastingNotes(
      nose: json['nose'] ?? '',
      palate: json['palate'] ?? '',
      finish: json['finish'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nose': nose,
      'palate': palate,
      'finish': finish,
    };
  }

  TastingNotes copyWith({
    String? nose,
    String? palate,
    String? finish,
  }) {
    return TastingNotes(
      nose: nose ?? this.nose,
      palate: palate ?? this.palate,
      finish: finish ?? this.finish,
    );
  }

}
