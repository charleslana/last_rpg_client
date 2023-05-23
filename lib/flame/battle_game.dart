import 'dart:async';

import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';

import '../data/character_data.dart';
import '../data/character_position_data.dart';
import 'components/battle_background_component.dart';
import 'components/character_component.dart';
import 'components/character_position_component.dart';
import 'components/skill_component.dart';

class BattleGame extends FlameGame {
  late CharacterComponent _character1;
  late CharacterComponent _character2;
  late CharacterComponent _character3;
  late CharacterComponent _character4;
  late CharacterComponent _character5;
  late CharacterComponent _character6;

  late CharacterComponent _enemy1;
  late CharacterComponent _enemy2;
  late CharacterComponent _enemy3;
  late CharacterComponent _enemy4;
  late CharacterComponent _enemy5;
  late CharacterComponent _enemy6;

  late CharacterPositionComponent _characterPosition1;
  late CharacterPositionComponent _characterPosition2;
  late CharacterPositionComponent _characterPosition3;
  late CharacterPositionComponent _characterPosition4;
  late CharacterPositionComponent _characterPosition5;
  late CharacterPositionComponent _characterPosition6;

  late CharacterPositionComponent _enemyPosition1;
  late CharacterPositionComponent _enemyPosition2;
  late CharacterPositionComponent _enemyPosition3;
  late CharacterPositionComponent _enemyPosition4;
  late CharacterPositionComponent _enemyPosition5;
  late CharacterPositionComponent _enemyPosition6;

  double moveForwardDuration = 0.5 - 0.0;
  double moveBackDuration = 0.5 - 0.0;
  int moveWaitDuration = 0;
  late int moveLoopDuration;

  @override
  Color backgroundColor() => Colors.white;

  @override
  FutureOr<void> onLoad() async {
    setMoveLoopDuration();

    await add(BattleBackgroundComponent());

    _character1 = CharacterComponent(character: warrior1);
    _character2 = CharacterComponent(character: warrior2);
    _character3 = CharacterComponent(character: warrior1);
    _character4 = CharacterComponent(character: warrior1);
    _character5 = CharacterComponent(character: warrior1);
    _character6 = CharacterComponent(character: warrior1);

    _enemy1 = CharacterComponent(character: warrior2, isFlip: true);
    _enemy2 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy3 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy4 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy5 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy6 = CharacterComponent(character: warrior2, isFlip: true);

    _characterPosition1 = CharacterPositionComponent(
      character: _character1,
      positionX: positionAllyX1,
      positionY: positionAllyY1,
      priorityCharacter: 1,
    );

    _characterPosition2 = CharacterPositionComponent(
      character: _character2,
      positionX: positionAllyX2,
      positionY: positionAllyY2,
      priorityCharacter: 2,
    );

    _characterPosition3 = CharacterPositionComponent(
      character: _character3,
      positionX: positionAllyX3,
      positionY: positionAllyY3,
      priorityCharacter: 3,
    );

    _characterPosition4 = CharacterPositionComponent(
      character: _character4,
      positionX: positionAllyX4,
      positionY: positionAllyY4,
      priorityCharacter: 4,
    );

    _characterPosition5 = CharacterPositionComponent(
      character: _character5,
      positionX: positionAllyX5,
      positionY: positionAllyY5,
      priorityCharacter: 5,
    );

    _characterPosition6 = CharacterPositionComponent(
      character: _character6,
      positionX: positionAllyX6,
      positionY: positionAllyY6,
      priorityCharacter: 6,
    );

    _enemyPosition1 = CharacterPositionComponent(
      character: _enemy1,
      positionX: positionEnemyX1,
      positionY: positionEnemyY1,
      priorityCharacter: 1,
    );

    _enemyPosition2 = CharacterPositionComponent(
      character: _enemy2,
      positionX: positionEnemyX2,
      positionY: positionEnemyY2,
      priorityCharacter: 2,
    );

    _enemyPosition3 = CharacterPositionComponent(
      character: _enemy3,
      positionX: positionEnemyX3,
      positionY: positionEnemyY3,
      priorityCharacter: 3,
    );

    _enemyPosition4 = CharacterPositionComponent(
      character: _enemy4,
      positionX: positionEnemyX4,
      positionY: positionEnemyY4,
      priorityCharacter: 4,
    );

    _enemyPosition5 = CharacterPositionComponent(
      character: _enemy5,
      positionX: positionEnemyX5,
      positionY: positionEnemyY5,
      priorityCharacter: 5,
    );

    _enemyPosition6 = CharacterPositionComponent(
      character: _enemy6,
      positionX: positionEnemyX6,
      positionY: positionEnemyY6,
      priorityCharacter: 6,
    );

    await add(_characterPosition1);
    await add(_characterPosition2);
    await add(_characterPosition3);
    await add(_characterPosition4);
    await add(_characterPosition5);
    await add(_characterPosition6);

    await add(_enemyPosition1);
    await add(_enemyPosition2);
    await add(_enemyPosition3);
    await add(_enemyPosition4);
    await add(_enemyPosition5);
    await add(_enemyPosition6);

    await add(SkillComponent());
    return super.onLoad();
  }

  void setMoveLoopDuration() {
    moveLoopDuration = (moveForwardDuration * 1000).toInt() +
        (moveBackDuration * 1000).toInt() +
        moveWaitDuration;
  }

  Future<void> runAllCharacters() async {
    _enemyPosition6.character.resetOpacity();
    final list = [1, 2, 3, 4, 5];
    int loopDuration = 0;
    await Future.forEach(list, (i) async {
      switch (i) {
        case 1:
          await _moveCharacter(_enemyPosition6, _characterPosition1);
          break;
        case 2:
          final characterPosition = _characterPosition2;
          loopDuration =
              moveLoopDuration + _enemyPosition6.character.getWaitHit();
          await Future.delayed(Duration(milliseconds: loopDuration), () async {
            await _moveCharacter(characterPosition, _enemyPosition6);
          });
          break;
        case 3:
          final characterPosition = _characterPosition3;
          loopDuration =
              moveLoopDuration + characterPosition.character.getWaitHit();
          await Future.delayed(Duration(milliseconds: loopDuration), () async {
            await _moveCharacter(characterPosition, _enemyPosition6);
          });
          break;
        case 4:
          final characterPosition = _characterPosition4;
          loopDuration =
              moveLoopDuration + characterPosition.character.getWaitHit();
          await Future.delayed(Duration(milliseconds: loopDuration), () async {
            await _moveCharacter(characterPosition, _enemyPosition6, true);
          });
          break;
      }
    });
  }

  Future<void> _moveCharacter(
      CharacterPositionComponent source, CharacterPositionComponent target,
      [bool death = false]) async {
    final characterPosition = source;
    final enemyPosition = target;
    characterPosition.changePriority(7);
    await characterPosition.hideAll();
    await characterPosition.character.setRunningAnimation();
    await characterPosition.add(
      MoveToEffect(
        enemyPosition.getStartingPosition(),
        EffectController(duration: moveForwardDuration),
      )..onComplete = () async {
          await characterPosition.character.setHitAnimation();
          await enemyPosition.character.setDefenseAnimation();
          await enemyPosition.character.setDamageColor();
          await Future.delayed(
              Duration(
                  milliseconds: characterPosition.character.getWaitHit() -
                      moveWaitDuration), () async {
            enemyPosition.emptyHpBarComponent.changeSize(25);
            await enemyPosition.damageComponent.show(145025);
            if (death) {
              await enemyPosition.character.setDeathAnimation();
              await enemyPosition.hideAll();
            } else {
              await enemyPosition.character.setIdleAnimation();
            }
            await characterPosition.character.setRunningAnimation();
            await _moveStartingPosition(characterPosition);
          });
        },
    );
  }

  Future<void> _moveStartingPosition(
      CharacterPositionComponent characterPosition) async {
    Anchor anchor = characterPosition.character.anchor;
    if (anchor == Anchor.bottomLeft) {
      anchor = Anchor.bottomRight;
    } else {
      anchor = Anchor.bottomLeft;
    }
    characterPosition.character.flipHorizontally();
    await characterPosition.add(
      MoveToEffect(
        characterPosition.getStartingPosition(),
        EffectController(duration: moveBackDuration),
      )..onComplete = () async {
          characterPosition.changePriority(characterPosition.priorityCharacter);
          if (anchor == Anchor.bottomLeft) {
            anchor = Anchor.bottomRight;
          } else {
            anchor = Anchor.bottomLeft;
          }
          characterPosition.character.flipHorizontally();
          await characterPosition.character.setIdleAnimation();
          await characterPosition.showAll();
          characterPosition.emptyRageBarComponent.changeSize(50);
          setMoveLoopDuration();
        },
    );
  }
}
