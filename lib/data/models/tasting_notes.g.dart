// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasting_notes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TastingNotesAdapter extends TypeAdapter<TastingNotes> {
  @override
  final int typeId = 3;

  @override
  TastingNotes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TastingNotes(
      nose: fields[0] as String,
      palate: fields[1] as String,
      finish: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TastingNotes obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nose)
      ..writeByte(1)
      ..write(obj.palate)
      ..writeByte(2)
      ..write(obj.finish);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TastingNotesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
