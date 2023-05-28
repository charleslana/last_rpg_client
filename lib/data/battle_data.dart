import 'package:last_rpg_client/enum/character_class_enum.dart';
import 'package:last_rpg_client/enum/character_turn_enum.dart';
import 'package:last_rpg_client/enum/rarity_enum.dart';
import 'package:last_rpg_client/model/battle_report_model.dart';
import 'package:last_rpg_client/model/character_model.dart';
import 'package:last_rpg_client/model/user_character_model.dart';

final warriorCharacter = UserCharacterModel(
  character: CharacterModel(
    id: 1,
    name: "Warrior",
    characterClass: CharacterClassEnum.values.byName("warrior"),
    hp: 100,
    furyHit: 10,
    furyDefense: 20,
    agility: 1,
    rarity: RarityEnum.values.byName("a"),
  ),
  level: 1,
);

final guardianCharacter = UserCharacterModel(
  character: CharacterModel(
    id: 2,
    name: "Guardian",
    characterClass: CharacterClassEnum.values.byName("guardian"),
    hp: 100,
    furyHit: 10,
    furyDefense: 20,
    agility: 1,
    rarity: RarityEnum.values.byName("a"),
  ),
  level: 2,
);

final List<UserCharacterModel> friendCharacters = [
  warriorCharacter,
  guardianCharacter,
];

final List<UserCharacterModel> enemyCharacters = [
  guardianCharacter,
  warriorCharacter,
];

final reportModel = [
  ReportModel(
    turnQuantity: 1,
    turn: CharacterTurnEnum.values.byName("friend"),
    friendPosition: 1,
    enemyPosition: 1,
    hpDefense: 90,
    damage: 10,
    furyDefense: 10,
    furyAttack: 5,
  ),
  ReportModel(
    turnQuantity: 1,
    turn: CharacterTurnEnum.values.byName("friend"),
    friendPosition: 2,
    enemyPosition: 1,
    hpDefense: 60,
    damage: 25,
    furyDefense: 20,
    furyAttack: 5,
  ),
  ReportModel(
    turnQuantity: 1,
    turn: CharacterTurnEnum.values.byName("enemy"),
    friendPosition: 1,
    enemyPosition: 1,
  ),
  ReportModel(
    turnQuantity: 1,
    turn: CharacterTurnEnum.values.byName("enemy"),
    friendPosition: 1,
    enemyPosition: 2,
    hpDefense: 90,
    damage: 10,
    furyDefense: 10,
    furyAttack: 5,
  ),
  ReportModel(
    turnQuantity: 2,
    turn: CharacterTurnEnum.values.byName("friend"),
    friendPosition: 1,
    enemyPosition: 1,
    hpDefense: 0,
    damage: 70,
    furyDefense: 100,
    furyAttack: 10,
    death: true,
  ),
];

final battleReport = BattleReportModel(
  friendCharacters: friendCharacters,
  enemyCharacters: enemyCharacters,
  reports: reportModel,
  win: true,
);
