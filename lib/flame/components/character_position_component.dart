import 'package:flame/components.dart';
import 'package:last_rpg_client/flame/components/shadow_component.dart';

import '../battle_game.dart';
import 'character_component.dart';
import 'damage_component.dart';
import 'empty_hp_bar_component.dart';
import 'empty_fury_bar_component.dart';

class CharacterPositionComponent extends PositionComponent
    with HasGameRef<BattleGame> {
  final CharacterComponent character;
  final double positionX;
  final double positionY;
  final int priorityCharacter;

  CharacterPositionComponent({
    required this.character,
    required this.positionX,
    required this.positionY,
    required this.priorityCharacter,
  });

  CharacterPositionComponent copyWith({
    CharacterComponent? character,
    double? positionX,
    double? positionY,
    int? priorityCharacter,
  }) {
    return CharacterPositionComponent(
      character: character ?? this.character,
      positionX: positionX ?? this.positionX,
      positionY: positionY ?? this.positionY,
      priorityCharacter: priorityCharacter ?? this.priorityCharacter,
    );
  }

  late EmptyHpBarComponent emptyHpBarComponent;
  late EmptyFuryBarComponent emptyFuryBarComponent;
  late DamageComponent damageComponent;
  late ShadowComponent shadowComponent;

  late Vector2 _starterPosition;

  @override
  Future<void> onLoad() async {
    debugMode = false;

    size = Vector2.all(gameRef.size.y * 20 / 100);

    priority = priorityCharacter;

    final initPosition = Vector2(
        gameRef.size.x * positionX / 100, gameRef.size.y * positionY / 100);

    position = initPosition;

    _starterPosition = initPosition;

    shadowComponent = ShadowComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
    );
    await add(shadowComponent);

    await add(character);

    emptyHpBarComponent = EmptyHpBarComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
      isFlip: character.isFlip,
    );
    await add(emptyHpBarComponent);

    emptyFuryBarComponent = EmptyFuryBarComponent(
      characterPositionSize: size,
      characterScale: character.character.scale,
      isFlip: character.isFlip,
    );
    await add(emptyFuryBarComponent);

    damageComponent = DamageComponent(characterPositionSize: size);
    await add(damageComponent);

    return super.onLoad();
  }

  void changePriority(int value) {
    priority = value;
  }

  Vector2 getStartingPosition() {
    return _starterPosition;
  }

  Future<void> hideAll() async {
    await emptyHpBarComponent.hide();
    await shadowComponent.hide();
    await emptyFuryBarComponent.hide();
  }

  Future<void> showAll() async {
    await emptyHpBarComponent.show();
    await shadowComponent.show();
    await emptyFuryBarComponent.show();
  }
}
