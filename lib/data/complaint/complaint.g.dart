// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComplaintAdapter extends TypeAdapter<Complaint> {
  @override
  final typeId = 1;

  @override
  Complaint read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Complaint(
      fields[0] as String,
      fields[1] as String,
      fields[2] as Bin,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Complaint obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.complaintID)
      ..writeByte(1)
      ..write(obj.userID)
      ..writeByte(2)
      ..write(obj.bin)
      ..writeByte(3)
      ..write(obj.complaintMessage)
      ..writeByte(4)
      ..write(obj.commentMessage)
      ..writeByte(5)
      ..write(obj.status);
  }
}
