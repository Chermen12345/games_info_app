// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameAdapter extends TypeAdapter<Game> {
  @override
  final int typeId = 1;

  @override
  Game read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Game(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, Game obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.released)
      ..writeByte(2)
      ..write(obj.background_image)
      ..writeByte(3)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      json['name'] as String,
      json['released'] as String,
      json['background_image'] as String,
      (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'released': instance.released,
      'background_image': instance.background_image,
      'rating': instance.rating,
    };
