enum CharacterClassEnum {
  warrior,
  huntress,
  wizard,
}

extension CharacterClassEnumExtension on CharacterClassEnum {
  String get name {
    switch (this) {
      case CharacterClassEnum.warrior:
        return 'Guerreiro';
      case CharacterClassEnum.huntress:
        return 'Caçadora';
      case CharacterClassEnum.wizard:
        return 'Mago';
      default:
        return "";
    }
  }
}
