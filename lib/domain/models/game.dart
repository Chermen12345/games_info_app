import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'game.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Game extends Equatable {
  @HiveField(0)
  String name;
  @HiveField(1)
  String released;
  @HiveField(2)
  String background_image;
  @HiveField(3)
  double rating;

  Game(
    this.name,
    this.released,
    this.background_image,
    this.rating,
  );

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  Map<String, dynamic> toJson() => _$GameToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [name, released, background_image, rating];
}
