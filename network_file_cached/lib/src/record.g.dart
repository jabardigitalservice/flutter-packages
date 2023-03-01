// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CacheRecordAdapter extends TypeAdapter<CacheRecord> {
  @override
  final int typeId = 1;

  @override
  CacheRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CacheRecord(
      fields[0] as String,
      fields[1] as String,
      fields[2] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CacheRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
