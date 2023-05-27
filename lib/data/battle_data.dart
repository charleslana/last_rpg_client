import 'package:last_rpg_client/enum/character_class_enum.dart';
import 'package:last_rpg_client/enum/rarity_enum.dart';
import 'package:last_rpg_client/model/character_model.dart';
import 'package:last_rpg_client/model/user_character_model.dart';

final List<UserCharacterModel> userCharacters = [
  UserCharacterModel(
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
  ),
  UserCharacterModel(
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
  ),
];

final List<UserCharacterModel> enemyCharacter = [
  UserCharacterModel(
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
    level: 1,
  ),
];
