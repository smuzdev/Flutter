// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computer_game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ComputerGameAdapter extends TypeAdapter<ComputerGame> {
  @override
  final int typeId = 0;

  @override
  ComputerGame read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComputerGame(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ComputerGame obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(3)
      ..write(obj.year);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComputerGameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
