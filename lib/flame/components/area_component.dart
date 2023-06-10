import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../battle_game.dart';
import '../models/character_flame_model.dart';

class AreaComponent extends PositionComponent with HasGameRef<BattleGame> {
  final CharacterFlameModel character;
  final bool isFlip;

  AreaComponent({
    required this.character,
    this.isFlip = false,
  });

  AreaComponent copyWith({
    CharacterFlameModel? character,
    bool? isFlip,
  }) {
    return AreaComponent(
      character: character ?? this.character,
      isFlip: isFlip ?? this.isFlip,
    );
  }

  final SpriteAnimationComponent _spriteAnimationComponent =
      SpriteAnimationComponent();

  @override
  Future<void>? onLoad() async {
    debugMode = false;

    await setAreaAnimation();

    scale = Vector2.all(gameRef.size.y * 0.50 / 80);

    priority = 7;

    position = Vector2(gameRef.size.x * 10 / 100, gameRef.size.y * 20 / 100);

    if (isFlip) {
      position = Vector2(gameRef.size.x * 90 / 100, gameRef.size.y * 20 / 100);
      flipHorizontally();
    }

    await add(_spriteAnimationComponent);
    return super.onLoad();
  }

  Future<void> setAreaAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.area!.image,
    );

    final spriteSize = character.area!.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.area!.amount,
      stepTime: character.area!.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.area!.amountPerRow,
      loop: character.area!.loop,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;
  }

  Future<void> hide() async {
    await _spriteAnimationComponent.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0),
      ),
    );
  }

  Future<void> show() async {
    await _spriteAnimationComponent.add(
      OpacityEffect.fadeIn(
        EffectController(duration: 0),
      ),
    );
  }
}
