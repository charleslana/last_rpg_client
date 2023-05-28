import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../data/image_data.dart';

class FuryBarComponent extends PositionComponent {
  SpriteComponent _spriteComponent = SpriteComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        furyBar,
        images: Images(prefix: ""),
      )
      ..size = Vector2(0, 8);

    priority = 1;

    await add(_spriteComponent);
    return super.onLoad();
  }

  void changeSize(int value) {
    final result = value * 80 / 100;
    _spriteComponent.size.x = result;
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
