import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../data/image_data.dart';

class HpBarComponent extends PositionComponent {
  SpriteComponent _spriteComponent = SpriteComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        hpBar,
        images: Images(prefix: ""),
      )
      ..size = Vector2(84, 8);

    priority = 1;

    await add(_spriteComponent);
    return super.onLoad();
  }

  void changeSize(int value) {
    final result = value * 84 / 100;
    _spriteComponent.size.x = result;
    if (result <= 25) {
      _changeSprite();
    }
  }

  Future<void> _changeSprite() async {
    _spriteComponent.sprite = await Sprite.load(
      hp1Bar,
      images: Images(prefix: ""),
    );
  }

  Future<void> hide() async {
    await _spriteComponent.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0),
      ),
    );
  }

  Future<void> show() async {
    await _spriteComponent.add(
      OpacityEffect.fadeIn(
        EffectController(duration: 0),
      ),
    );
  }
}
