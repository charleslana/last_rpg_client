import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../../utils/theme_util.dart';

class HitTextComponent extends TextComponent {
  final Vector2 characterPositionSize;
  final String hitText;
  final Color color;

  HitTextComponent({
    required this.characterPositionSize,
    required this.hitText,
    required this.color,
  });

  TextComponent _textComponent = TextComponent();

  @override
  Future<void> onLoad() async {
    _textComponent =
        _getTextComponent(_getTextPaint(characterPositionSize.y / 3.5));

    position =
        Vector2(0, characterPositionSize.y - characterPositionSize.y * 2.15);

    priority = 2;

    await add(_textComponent);

    hide();

    return super.onLoad();
  }

  TextComponent _getTextComponent(TextPaint textPaint) {
    return TextComponent(
      text: hitText.toUpperCase(),
      textRenderer: textPaint,
      size: Vector2(size.x / 7, size.y / 3),
      position: Vector2(size.x / 6.5, size.y / 50),
    );
  }

  TextPaint _getTextPaint(double fontSize) {
    return TextPaint(
      style: highSpeedRegular().copyWith(
        color: color,
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

  void hide() {
    _textComponent.textRenderer = _getTextPaint(0);
  }

  Future<void> show() async {
    _textComponent.textRenderer = _getTextPaint(characterPositionSize.y / 3.5);
    _textComponent.text = hitText.toUpperCase();
    await _move();
  }

  Future<void> _move() async {
    await _textComponent.add(MoveToEffect(
      Vector2(0, position.y + characterPositionSize.y / 1.5),
      EffectController(duration: 1),
    )..onComplete = () async {
        hide();
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
