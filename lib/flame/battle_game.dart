import 'dart:async';

import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:last_rpg_client/data/battle_data.dart';
import 'package:last_rpg_client/enum/character_turn_enum.dart';
import 'package:last_rpg_client/model/battle_report_model.dart';

import '../data/character_data.dart';
import '../data/character_position_data.dart';
import 'components/battle_background_component.dart';
import 'components/character_component.dart';
import 'components/character_position_component.dart';
import 'components/skill_component.dart';

class BattleGame extends FlameGame {
  late CharacterComponent _friend1;
  late CharacterComponent _friend2;
  late CharacterComponent _friend3;
  late CharacterComponent _friend4;
  late CharacterComponent _friend5;
  late CharacterComponent _friend6;

  late CharacterComponent _enemy1;
  late CharacterComponent _enemy2;
  late CharacterComponent _enemy3;
  late CharacterComponent _enemy4;
  late CharacterComponent _enemy5;
  late CharacterComponent _enemy6;

  late CharacterPositionComponent _friendPosition1;
  late CharacterPositionComponent _friendPosition2;
  late CharacterPositionComponent _friendPosition3;
  late CharacterPositionComponent _friendPosition4;
  late CharacterPositionComponent _friendPosition5;
  late CharacterPositionComponent _friendPosition6;

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

    _addCharacters();

    await _mountBattle();

    await add(SkillComponent());
    return super.onLoad();
  }

  void setMoveLoopDuration() {
    moveLoopDuration = (moveForwardDuration * 1000).toInt() +
        (moveBackDuration * 1000).toInt() +
        moveWaitDuration;
  }

  Future<void> runAllCharacters() async {
    final reports = getReport().reports;
    int loopDuration = 0;
    await Future.forEach(reports, (report) async {
      final source = _getTurn(report);
      var target = _getEnemyPosition(report.enemyPosition);
      if (report.turn == CharacterTurnEnum.enemy) {
        target = _getFriendPosition(report.friendPosition);
      }
      if (reports.first == report) {
        await _moveCharacter(source, target, report);
        return;
      }
      loopDuration = moveLoopDuration + target.character.getWaitHit();
      await Future.delayed(Duration(milliseconds: loopDuration), () async {
        await _moveCharacter(source, target, report);
      });
    });
  }

  CharacterPositionComponent _getTurn(ReportModel report) {
    if (report.turn == CharacterTurnEnum.friend) {
      return _getFriendPosition(report.friendPosition);
    }
    return _getEnemyPosition(report.enemyPosition);
  }

  CharacterPositionComponent _getFriendPosition(int position) {
    switch (position) {
      case 1:
        return _friendPosition1;
      case 2:
        return _friendPosition2;
      case 3:
        return _friendPosition3;
      case 4:
        return _friendPosition4;
      case 5:
        return _friendPosition5;
      case 6:
        return _friendPosition6;
      default:
        return _friendPosition1;
    }
  }

  CharacterPositionComponent _getEnemyPosition(int position) {
    switch (position) {
      case 1:
        return _enemyPosition1;
      case 2:
        return _enemyPosition2;
      case 3:
        return _enemyPosition3;
      case 4:
        return _enemyPosition4;
      case 5:
        return _enemyPosition5;
      case 6:
        return _enemyPosition6;
      default:
        return _enemyPosition1;
    }
  }

  void _addCharacters() {
    _friend1 = CharacterComponent(character: warrior1);
    _friend2 = CharacterComponent(character: warrior2);
    _friend3 = CharacterComponent(character: warrior1);
    _friend4 = CharacterComponent(character: warrior1);
    _friend5 = CharacterComponent(character: warrior1);
    _friend6 = CharacterComponent(character: warrior1);

    _enemy1 = CharacterComponent(character: warrior2, isFlip: true);
    _enemy2 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy3 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy4 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy5 = CharacterComponent(character: warrior1, isFlip: true);
    _enemy6 = CharacterComponent(character: warrior2, isFlip: true);

    _friendPosition1 = CharacterPositionComponent(
      character: _friend1,
      positionX: positionAllyX1,
      positionY: positionAllyY1,
      priorityCharacter: 1,
    );

    _friendPosition2 = CharacterPositionComponent(
      character: _friend2,
      positionX: positionAllyX2,
      positionY: positionAllyY2,
      priorityCharacter: 2,
    );

    _friendPosition3 = CharacterPositionComponent(
      character: _friend3,
      positionX: positionAllyX3,
      positionY: positionAllyY3,
      priorityCharacter: 3,
    );

    _friendPosition4 = CharacterPositionComponent(
      character: _friend4,
      positionX: positionAllyX4,
      positionY: positionAllyY4,
      priorityCharacter: 4,
    );

    _friendPosition5 = CharacterPositionComponent(
      character: _friend5,
      positionX: positionAllyX5,
      positionY: positionAllyY5,
      priorityCharacter: 5,
    );

    _friendPosition6 = CharacterPositionComponent(
      character: _friend6,
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
  }

  Future<void> _mountBattle() async {
    await _mountFriends();
    await _mountEnemies();
  }

  BattleReportModel getReport() {
    return battleReport;
  }

  Future<void> _mountFriends() async {
    getReport().friendCharacters.asMap().forEach((index, uc) async {
      if (index == 0) {
        _friend1 = _friend1.copyWith(character: getCharacter(uc.character));
        _friendPosition1 = _friendPosition1.copyWith(character: _friend1);
        await add(_friendPosition1);
      }
      if (index == 1) {
        _friend2 = _friend2.copyWith(character: getCharacter(uc.character));
        _friendPosition2 = _friendPosition2.copyWith(character: _friend2);
        await add(_friendPosition2);
      }
      if (index == 2) {
        _friend3 = _friend3.copyWith(character: getCharacter(uc.character));
        _friendPosition3 = _friendPosition3.copyWith(character: _friend3);
        await add(_friendPosition3);
      }
      if (index == 3) {
        _friend4 = _friend4.copyWith(character: getCharacter(uc.character));
        _friendPosition4 = _friendPosition4.copyWith(character: _friend4);
        await add(_friendPosition4);
      }
      if (index == 4) {
        _friend5 = _friend5.copyWith(character: getCharacter(uc.character));
        _friendPosition5 = _friendPosition5.copyWith(character: _friend5);
        await add(_friendPosition5);
      }
      if (index == 5) {
        _friend6 = _friend6.copyWith(character: getCharacter(uc.character));
        _friendPosition6 = _friendPosition6.copyWith(character: _friend6);
        await add(_friendPosition6);
      }
    });
  }

  Future<void> _mountEnemies() async {
    getReport().enemyCharacters.asMap().forEach((index, uc) async {
      if (index == 0) {
        _enemy1 = _enemy1.copyWith(character: getCharacter(uc.character));
        _enemyPosition1 = _enemyPosition1.copyWith(character: _enemy1);
        await add(_enemyPosition1);
      }
      if (index == 1) {
        _enemy2 = _enemy2.copyWith(character: getCharacter(uc.character));
        _enemyPosition2 = _enemyPosition2.copyWith(character: _enemy2);
        await add(_enemyPosition2);
      }
      if (index == 2) {
        _enemy3 = _enemy3.copyWith(character: getCharacter(uc.character));
        _enemyPosition3 = _enemyPosition3.copyWith(character: _enemy3);
        await add(_enemyPosition3);
      }
      if (index == 3) {
        _enemy4 = _enemy4.copyWith(character: getCharacter(uc.character));
        _enemyPosition4 = _enemyPosition4.copyWith(character: _enemy4);
        await add(_enemyPosition4);
      }
      if (index == 4) {
        _enemy5 = _enemy5.copyWith(character: getCharacter(uc.character));
        _enemyPosition5 = _enemyPosition5.copyWith(character: _enemy5);
        await add(_enemyPosition5);
      }
      if (index == 5) {
        _enemy6 = _enemy6.copyWith(character: getCharacter(uc.character));
        _enemyPosition6 = _enemyPosition6.copyWith(character: _enemy6);
        await add(_enemyPosition6);
      }
    });
  }

  Future<void> _moveCharacter(CharacterPositionComponent source,
      CharacterPositionComponent target, ReportModel report) async {
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
          if (report.hpDefense != null) {
            await enemyPosition.character.setDamageColor();
          }
          await Future.delayed(
              Duration(
                  milliseconds: characterPosition.character.getWaitHit() -
                      moveWaitDuration), () async {
            if (report.hpDefense != null) {
              enemyPosition.emptyHpBarComponent.changeSize(report.hpDefense!);
              await enemyPosition.damageComponent.show(report.damage!);
            }
            if (report.death == true) {
              await enemyPosition.character.setDeathAnimation();
              await enemyPosition.hideAll();
            } else {
              await enemyPosition.character.setIdleAnimation();
              if (report.furyDefense != null) {
                target.emptyFuryBarComponent.changeSize(report.furyDefense!);
              }
            }
            await characterPosition.character.setRunningAnimation();
            await _moveStartingPosition(characterPosition, report);
          });
        },
    );
  }

  Future<void> _moveStartingPosition(
      CharacterPositionComponent characterPosition, ReportModel report) async {
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
          if (report.furyAttack != null) {
            characterPosition.emptyFuryBarComponent
                .changeSize(report.furyAttack!);
          }
          setMoveLoopDuration();
        },
    );
  }
}
