import 'package:last_rpg_client/flame/models/character_flame_model.dart';

class BattleReportModel {
  final int turn;
  final List<Report> report;
  final bool win;
  BattleReportModel({
    required this.turn,
    required this.report,
    required this.win,
  });
}

class Report {
  final Character character;
  final Character enemy;
  Report({
    required this.character,
    required this.enemy,
  });
}

class Character {
  final CharacterFlameModel characterModel;
  Character({
    required this.characterModel,
  });
}
