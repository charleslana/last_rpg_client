import 'package:flame/components.dart';

class CharacterFlameModel {
  final double scale;
  final SpriteModel idle;
  final SpriteModel? run;
  final SpriteModel attack;
  final SpriteModel defense;
  final SpriteModel death;
  final SpriteModel? magic;

  const CharacterFlameModel({
    required this.scale,
    required this.idle,
    this.run,
    required this.attack,
    required this.defense,
    required this.death,
    this.magic,
  });
}

class SpriteModel {
  final String image;
  final Vector2 size;
  final int amount;
  final double stepTime;
  final int? amountPerRow;
  final bool loop;
  final double? hitTime;

  const SpriteModel({
    required this.image,
    required this.size,
    required this.amount,
    required this.stepTime,
    this.amountPerRow,
    this.loop = true,
    this.hitTime,
  });
}
