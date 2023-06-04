import 'package:flame/components.dart';
import 'package:last_rpg_client/model/character_model.dart';

import '../flame/models/character_flame_model.dart';
import 'image_data.dart';

final character1 = CharacterFlameModel(
  scale: 0.35,
  idle: SpriteModel(
    image: character1Idle,
    size: Vector2(33, 56),
    amount: 4,
    stepTime: 0.2,
  ),
  run: SpriteModel(
    image: character1Run,
    size: Vector2(44, 49),
    amount: 8,
    stepTime: 0.1,
  ),
  attack: SpriteModel(
    image: character1Attack,
    size: Vector2(94, 65),
    amount: 4,
    stepTime: 0.2,
    hitTime: 0.6,
    loop: false,
  ),
  defense: SpriteModel(
    image: character1Defense,
    size: Vector2(36, 56),
    amount: 3,
    stepTime: 0.1,
    loop: false,
  ),
  death: SpriteModel(
    image: character1Death,
    size: Vector2(74, 56),
    amount: 7,
    stepTime: 0.1,
    loop: false,
  ),
);

final character2 = CharacterFlameModel(
  scale: 0.35,
  idle: SpriteModel(
    image: character2Idle,
    size: Vector2(32, 36),
    amount: 10,
    amountPerRow: 1,
    stepTime: 0.1,
  ),
  attack: SpriteModel(
    image: character2Attack,
    size: Vector2(40, 45),
    amount: 6,
    stepTime: 0.1,
    hitTime: 0.7,
    loop: false,
  ),
  defense: SpriteModel(
    image: character2Defense,
    size: Vector2(30, 40),
    amount: 3,
    amountPerRow: 1,
    stepTime: 0.1,
    loop: false,
  ),
  death: SpriteModel(
    image: character2Death,
    size: Vector2(63, 34),
    amount: 10,
    amountPerRow: 1,
    stepTime: 0.1,
    loop: false,
  ),
  magic: SpriteModel(
    image: character2Magic,
    size: Vector2(22, 3),
    amount: 1,
    stepTime: 0.1,
  ),
);

CharacterFlameModel getCharacter(CharacterModel character) {
  switch (character.id) {
    case 1:
      return character1;
    case 2:
      return character2;
    default:
      return character1;
  }
}
