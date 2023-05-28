import 'package:last_rpg_client/enum/character_turn_enum.dart';
import 'package:last_rpg_client/model/user_character_model.dart';

class BattleReportModel {
  final List<UserCharacterModel> friendCharacters;
  final List<UserCharacterModel> enemyCharacters;
  final List<ReportModel> reports;
  final bool win;
  BattleReportModel({
    required this.friendCharacters,
    required this.enemyCharacters,
    required this.reports,
    required this.win,
  });
}

class ReportModel {
  final int turnQuantity;
  final CharacterTurnEnum turn;
  final int friendPosition;
  final int enemyPosition;
  final int? hpDefense;
  final int? damage;
  final int? furyDefense;
  final int? furyAttack;
  final bool? death;
  ReportModel({
    required this.turnQuantity,
    required this.turn,
    required this.friendPosition,
    required this.enemyPosition,
    this.hpDefense,
    this.damage,
    this.furyDefense,
    this.furyAttack,
    this.death,
  });
}
