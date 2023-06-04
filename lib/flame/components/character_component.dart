import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../battle_game.dart';
import '../models/character_flame_model.dart';

class CharacterComponent extends SpriteAnimationComponent
    with HasGameRef<BattleGame> {
  final CharacterFlameModel character;
  final bool isFlip;

  CharacterComponent({
    required this.character,
    this.isFlip = false,
  });

  CharacterComponent copyWith({
    CharacterFlameModel? character,
    bool? isFlip,
  }) {
    return CharacterComponent(
      character: character ?? this.character,
      isFlip: isFlip ?? this.isFlip,
    );
  }

  final SpriteAnimationComponent _spriteAnimationComponent =
      SpriteAnimationComponent();

  @override
  Future<void>? onLoad() async {
    debugMode = false;

    await setIdleAnimation();

    scale = Vector2.all(gameRef.size.y * character.scale / 80);

    anchor = Anchor.bottomLeft;

    if (isFlip) {
      anchor = Anchor.bottomRight;
      flipHorizontally();
    }

    await add(_spriteAnimationComponent);
    return super.onLoad();
  }

  Future<void> setIdleAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.idle.image,
    );

    final spriteSize = character.idle.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.idle.amount,
      stepTime: character.idle.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.idle.amountPerRow,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;
  }

  Future<void> setRunningAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.run!.image,
    );
    final spriteSize = character.run!.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.run!.amount,
      stepTime: character.run!.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.run!.amountPerRow,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;
  }

  Future<SpriteAnimationComponent> setAttackAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.attack.image,
    );
    final spriteSize = character.attack.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.attack.amount,
      stepTime: character.attack.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.attack.amountPerRow,
      loop: character.attack.loop,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;

    return _spriteAnimationComponent;
  }

  Future<void> setMagicAnimation(Vector2 siz) async {
    final spriteSheet = await Images(prefix: "").load(
      character.magic!.image,
    );
    final spriteSize = character.magic!.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.magic!.amount,
      stepTime: character.magic!.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.magic!.amountPerRow,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    position = Vector2(0, siz.y - siz.y * 1.50);

    size = spriteSize;
  }

  int getWaitHit() {
    return (character.attack.hitTime! * 1000).toInt();
  }

  Future<void> setDamageColor() async {
    await _spriteAnimationComponent.add(
      ColorEffect(
        Colors.white,
        const Offset(
          0,
          1,
        ),
        EffectController(
          duration: 0.1,
          reverseDuration: 0.1,
        ),
      ),
    );
  }

  Future<void> setDefenseAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.defense.image,
    );
    final spriteSize = character.defense.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.defense.amount,
      stepTime: character.defense.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.defense.amountPerRow,
      loop: character.defense.loop,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;
  }

  Future<void> setDeathAnimation() async {
    final spriteSheet = await Images(prefix: "").load(
      character.death.image,
    );
    final spriteSize = character.death.size;

    SpriteAnimationData spriteAnimationData = SpriteAnimationData.sequenced(
      amount: character.death.amount,
      stepTime: character.death.stepTime,
      textureSize: spriteSize,
      amountPerRow: character.death.amountPerRow,
      loop: character.death.loop,
    );

    final spriteAnimation = SpriteAnimationComponent.fromFrameData(
        spriteSheet, spriteAnimationData);

    _spriteAnimationComponent
      ..animation = spriteAnimation.animation
      ..size = spriteSize;

    size = spriteSize;

    _setDeathOpacity();
  }

  Future<void> _setDeathOpacity() async {
    await _spriteAnimationComponent.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0.75),
      ),
    );
  }

  Future<void> resetOpacity() async {
    await _spriteAnimationComponent.add(
      OpacityEffect.fadeIn(
        EffectController(duration: 0),
      ),
    );
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
