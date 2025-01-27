// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemModelAdapter extends TypeAdapter<ItemModel> {
  @override
  final int typeId = 0;

  @override
  ItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemModel(
      id: fields[0] as String,
      name: fields[1] as String,
      imageUrl: fields[2] as String?,
      count: fields[3] as int?,
      total: fields[4] as int?,
      year: fields[5] as int?,
      batchNumber: fields[6] as int?,
      distillery: fields[7] as String?,
      region: fields[8] as String?,
      country: fields[9] as String?,
      type: fields[10] as String?,
      ageStatement: fields[11] as String?,
      filled: fields[12] as String?,
      bottled: fields[13] as String?,
      caskNumber: fields[14] as String?,
      abv: fields[15] as double?,
      size: fields[16] as String?,
      finish: fields[17] as String?,
      videoUrl: fields[18] as String?,
      officialNotes: fields[19] as TastingNotes?,
      userNotes: fields[20] as TastingNotes?,
      history: (fields[21] as List?)?.cast<HistoryEvent>(),
    );
  }

  @override
  void write(BinaryWriter writer, ItemModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.count)
      ..writeByte(4)
      ..write(obj.total)
      ..writeByte(5)
      ..write(obj.year)
      ..writeByte(6)
      ..write(obj.batchNumber)
      ..writeByte(7)
      ..write(obj.distillery)
      ..writeByte(8)
      ..write(obj.region)
      ..writeByte(9)
      ..write(obj.country)
      ..writeByte(10)
      ..write(obj.type)
      ..writeByte(11)
      ..write(obj.ageStatement)
      ..writeByte(12)
      ..write(obj.filled)
      ..writeByte(13)
      ..write(obj.bottled)
      ..writeByte(14)
      ..write(obj.caskNumber)
      ..writeByte(15)
      ..write(obj.abv)
      ..writeByte(16)
      ..write(obj.size)
      ..writeByte(17)
      ..write(obj.finish)
      ..writeByte(18)
      ..write(obj.videoUrl)
      ..writeByte(19)
      ..write(obj.officialNotes)
      ..writeByte(20)
      ..write(obj.userNotes)
      ..writeByte(21)
      ..write(obj.history);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
