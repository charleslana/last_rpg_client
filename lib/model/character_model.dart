import 'package:last_rpg_client/enum/character_class_enum.dart';
import 'package:last_rpg_client/enum/rarity_enum.dart';

class CharacterModel {
  final int id;
  final String name;
  final CharacterClassEnum characterClass;
  final int hp;
  final double furyHit;
  final double furyDefense;
  final int? attack;
  final int? magicAttack;
  final int? defense;
  final int? magicDefense;
  final int agility;
  final double? critical;
  final double? dodge;
  final RarityEnum rarity;

  CharacterModel({
    required this.id,
    required this.name,
    required this.characterClass,
    required this.hp,
    required this.furyHit,
    required this.furyDefense,
    this.attack,
    this.magicAttack,
    this.defense,
    this.magicDefense,
    required this.agility,
    this.critical,
    this.dodge,
    required this.rarity,
  });
}
