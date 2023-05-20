import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../../data/image_data.dart';
import 'hp_bar_component.dart';

class EmptyHpBarComponent extends PositionComponent {
  final Vector2 characterPositionSize;

  EmptyHpBarComponent({
    required this.characterPositionSize,
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

    position =
        Vector2(0, characterPositionSize.y - characterPositionSize.y * 2.20);

    priority = 1;

    await _spriteComponent.add(_hpBarComponent);

    await add(_spriteComponent);
    return super.onLoad();
  }

  void changeSize(int value) {
    _hpBarComponent.changeSize(value);
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
