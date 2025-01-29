import 'package:hive/hive.dart';

part 'history_event.g.dart';

//Command for generating Hive models: flutter pub run build_runner build

@HiveType(typeId: 2)
class HistoryEvent extends HiveObject {
  @HiveField(0)
  final String? label;

  @HiveField(1)
  final String? title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final List<String>? attachments;

  @HiveField(4)
  final DateTime? dateTime;

  HistoryEvent({
    this.label,
    this.title,
    this.description,
    this.attachments,
    this.dateTime,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      label: json['label'],
      title: json['title'],
      description: json['description'],
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      dateTime: json['dateTime'] != null
          ? DateTime.parse(json['dateTime'])
          : null, //Parse the dateTime string to a DateTime object in ISO 8601
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'title': title,
      'description': description,
      'attachments': attachments,
      'dateTime': dateTime?.toIso8601String(),
    };
  }

  HistoryEvent copyWith({
    String? label,
    String? title,
    String? description,
    List<String>? attachments,
    DateTime? dateTime,
  }) {
    return HistoryEvent(
      label: label ?? this.label,
      title: title ?? this.title,
      description: description ?? this.description,
      attachments: attachments ?? this.attachments,
      dateTime: dateTime ?? this.dateTime,
    );
  }

}
