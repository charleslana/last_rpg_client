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
    size: Vector2(42, 45),
    amount: 2,
    stepTime: 0.3,
    loop: false,
  ),
  death: SpriteModel(
    image: warrior1Death,
    size: Vector2(59, 20),
    amount: 1,
    stepTime: 0.1,
    loop: false,
  ),
);

final warrior2 = CharacterModel(
  scale: 0.35,
  idle: SpriteModel(
    image: warrior2Idle,
    size: Vector2(45, 48),
    amount: 5,
    stepTime: 0.15,
  ),
  run: SpriteModel(
    image: warrior2Run,
    size: Vector2(51, 53),
    amount: 6,
    stepTime: 0.1,
  ),
  hit: SpriteModel(
    image: warrior2Hit1,
    size: Vector2(78, 52),
    amount: 4,
    stepTime: 0.1,
    hitTime: 0.4,
    loop: false,
  ),
  defense: SpriteModel(
    image: warrior2Defense,
    size: Vector2(61, 47),
    amount: 2,
    stepTime: 0.3,
    loop: false,
  ),
  death: SpriteModel(
    image: warrior2Death,
    size: Vector2(57, 18),
    amount: 1,
    stepTime: 0.1,
    loop: false,
  ),
);
