import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../../utils/theme_util.dart';
import '../../utils/utils.dart';

class DamageComponent extends TextComponent {
  final Vector2 characterPositionSize;

  DamageComponent({
    required this.characterPositionSize,
  });

  TextComponent _textComponent = TextComponent();

  @override
  Future<void> onLoad() async {
    _textComponent =
        _getTextComponent(_getTextPaint(characterPositionSize.y / 3.5), 0);

    position =
        Vector2(0, characterPositionSize.y - characterPositionSize.y * 2.15);

    priority = 2;

    await add(_textComponent);

    _hide();

    return super.onLoad();
  }

  TextComponent _getTextComponent(TextPaint textPaint, int value) {
    return TextComponent(
      text: '-${numberAbbreviation(value)}',
      textRenderer: textPaint,
      size: Vector2(size.x / 7, size.y / 3),
      position: Vector2(size.x / 6.5, size.y / 50),
    );
  }

  TextPaint _getTextPaint(double fontSize) {
    return TextPaint(
      style: dinRegular().copyWith(
        color: Colors.red,
        fontSize: fontSize,
        shadows: const [
          Shadow(offset: Offset(-1.5, -1.5)),
          Shadow(offset: Offset(1.5, -1.5)),
          Shadow(offset: Offset(1.5, 1.5)),
          Shadow(offset: Offset(-1.5, 1.5)),
        ],
      ),
    );
  }

  void _hide() {
    _textComponent.textRenderer = _getTextPaint(0);
  }

  Future<void> show(int damageValue) async {
    _textComponent.textRenderer = _getTextPaint(characterPositionSize.y / 3.5);
    _textComponent.text = "-${decimalNumberFormat(damageValue.toString())}";
    await _move();
  }

  Future<void> _move() async {
    await _textComponent.add(MoveToEffect(
      Vector2(0, position.y + characterPositionSize.y / 1.5),
      EffectController(duration: 1),
    )..onComplete = () async {
        _hide();
        await _resetMove();
      });
  }

  Future<void> _resetMove() async {
    await _textComponent.add(MoveToEffect(
      Vector2(0, position.y + characterPositionSize.y),
      EffectController(duration: 0),
    ));
  }
}
