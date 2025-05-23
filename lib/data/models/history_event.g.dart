// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_event.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HistoryEventAdapter extends TypeAdapter<HistoryEvent> {
  @override
  final int typeId = 2;

  @override
  HistoryEvent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HistoryEvent(
      label: fields[0] as String?,
      title: fields[1] as String?,
      description: fields[2] as String?,
      attachments: (fields[3] as List?)?.cast<String>(),
      dateTime: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, HistoryEvent obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.attachments)
      ..writeByte(4)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HistoryEventAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
