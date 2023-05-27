enum CharacterClassEnum {
  warrior,
  guardian,
}

extension CharacterClassEnumExtension on CharacterClassEnum {
  String get name {
    switch (this) {
      case CharacterClassEnum.warrior:
        return 'Guerreiro';
      case CharacterClassEnum.guardian:
        return 'Guardião';
      default:
        return "";
    }
  }
}
