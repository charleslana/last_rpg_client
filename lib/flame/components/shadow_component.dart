import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../data/image_data.dart';

class ShadowComponent extends PositionComponent {
  final Vector2 characterPositionSize;
  final double characterScale;

  ShadowComponent({
    required this.characterPositionSize,
    required this.characterScale,
  });

  SpriteComponent _spriteComponent = SpriteComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        battleShadow,
        images: Images(prefix: ""),
      )
      ..size = Vector2(100, 56);

    scale = Vector2.all(characterPositionSize.x * characterScale / 40);

    position =
        Vector2(0, characterPositionSize.y - characterPositionSize.y * 1.2);

    await add(_spriteComponent);

    await show();

    return super.onLoad();
  }

  Future<void> hide() async {
    await _spriteComponent.add(
      OpacityEffect.to(
        0,
        EffectController(duration: 0),
      ),
    );
  }

  Future<void> show() async {
    await _spriteComponent.add(
      OpacityEffect.to(
        0.5,
        EffectController(duration: 0),
      ),
    );
  }
}
