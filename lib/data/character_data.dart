import 'package:flame/components.dart';

import '../flame/models/character_model.dart';
import 'image_data.dart';

final warrior1 = CharacterModel(
  scale: 0.35,
  idle: SpriteModel(
    image: warrior1Idle,
    size: Vector2(39, 47),
    amount: 6,
    stepTime: 0.1,
  ),
  run: SpriteModel(
    image: warrior1Run,
    size: Vector2(50, 47),
    amount: 6,
    stepTime: 0.1,
  ),
  hit: SpriteModel(
    image: warrior1Hit1,
    size: Vector2(67, 59),
    amount: 4,
    stepTime: 0.1,
    hitTime: 0.4,
    loop: false,
  ),
  defense: SpriteModel(
    image: warrior1Defense,
    size: Vector2(39, 47),
    amount: 6,
    stepTime: 0.3,
    loop: false,
  ),
  death: SpriteModel(
    image: warrior1Death,
    size: Vector2(39, 47),
    amount: 6,
    stepTime: 0.3,
    loop: false,
  ),
);
