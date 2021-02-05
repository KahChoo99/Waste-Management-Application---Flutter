// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BinAdapter extends TypeAdapter<Bin> {
  @override
  final typeId = 0;

  @override
  Bin read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Bin(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Bin obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.binID)
      ..writeByte(1)
      ..write(obj.fTState)
      ..writeByte(2)
      ..write(obj.district)
      ..writeByte(3)
      ..write(obj.subDistrict)
      ..writeByte(4)
      ..write(obj.area)
      ..writeByte(5)
      ..write(obj.cleaningPeriod);
  }
}
