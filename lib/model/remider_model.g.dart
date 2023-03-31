// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remider_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReminderModelAdapter extends TypeAdapter<ReminderModel> {
  @override
  final int typeId = 0;

  @override
  ReminderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReminderModel(
      pickedTimeHour: fields[0] as int,
      pickedTimeMinute: fields[1] as int,
      isReminderEnable: fields[2] as bool,
      createdTimeMilliseconds: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ReminderModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.pickedTimeHour)
      ..writeByte(1)
      ..write(obj.pickedTimeMinute)
      ..writeByte(2)
      ..write(obj.isReminderEnable)
      ..writeByte(3)
      ..write(obj.createdTimeMilliseconds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReminderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
