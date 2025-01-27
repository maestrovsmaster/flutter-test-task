import 'package:hive/hive.dart';

part 'history_event.g.dart';

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

  HistoryEvent({
    this.label,
    this.title,
    this.description,
    this.attachments,
  });

  factory HistoryEvent.fromJson(Map<String, dynamic> json) {
    return HistoryEvent(
      label: json['label'],
      title: json['title'],
      description: json['description'],
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'title': title,
      'description': description,
      'attachments': attachments,
    };
  }
}
