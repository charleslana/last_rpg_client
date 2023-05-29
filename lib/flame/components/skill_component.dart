import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';

import '../battle_game.dart';

class SkillComponent extends PositionComponent
    with HasGameRef<BattleGame>, TapCallbacks {
  final _paint = Paint()..color = const Color(0xffffffff);

  @override
  void onGameResize(Vector2 size) {
    position = Vector2(gameRef.size.x * 46 / 100, gameRef.size.y * 80 / 100);
    this.size = Vector2(32, 32);
    scale = Vector2.all(gameRef.size.x * 0.2 / 100);
    _paint.color = Colors.deepPurple;
    priority = 10;
    super.onGameResize(size);
  }

  @override
  void render(Canvas canvas) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      decoration: TextDecoration.underline,
    );
    const textSpan = TextSpan(
      text: "Tap",
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textScaleFactor: size.y / 100,
      textAlign: TextAlign.center,
    )..layout(
        maxWidth: size.x,
      );
    final xCenter = (size.x - textPainter.width) / 2;
    final yCenter = (size.y - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    canvas.drawRect(size.toRect(), _paint);
    textPainter.paint(canvas, offset);
    super.render(canvas);
  }

  @override
  void onTapUp(TapUpEvent event) {
    gameRef.runAllCharacters();
    _hide();
    super.onTapUp(event);
  }

  void _hide() {
    size = Vector2.all(0);
  }
}
