import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../data/image_data.dart';
import 'hp_bar_component.dart';

class EmptyHpBarComponent extends PositionComponent {
  final Vector2 characterPositionSize;
  final double characterScale;
  final bool isFlip;

  EmptyHpBarComponent({
    required this.characterPositionSize,
    required this.characterScale,
    required this.isFlip,
  });

  SpriteComponent _spriteComponent = SpriteComponent();
  final _hpBarComponent = HpBarComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        hpBgBar,
        images: Images(prefix: ""),
      )
      ..size = Vector2(86, 8);

    scale = Vector2.all(characterPositionSize.x * 0.7 / 100);

    double pX = 0;

    if (isFlip) {
      // pX = characterPositionSize.x * characterScale * 1.1;
    }

    position =
        Vector2(pX, characterPositionSize.y - characterPositionSize.y * 2.20);

    priority = 1;

    await add(_spriteComponent);
    await _spriteComponent.add(_hpBarComponent);

    return super.onLoad();
  }

  Future<void> changeSize(int value) async {
    await _hpBarComponent.changeSize(value);
  }

  Future<void> hide() async {
    await _hpBarComponent.hide();
    await _spriteComponent.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0),
      ),
    );
  }

  Future<void> show() async {
    await _hpBarComponent.show();
    await _spriteComponent.add(
      OpacityEffect.fadeIn(
        EffectController(duration: 0),
      ),
    );
  }
}
