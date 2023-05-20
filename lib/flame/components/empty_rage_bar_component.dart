import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:last_rpg_client/flame/components/rage_bar_component.dart';

import '../../data/image_data.dart';

class EmptyRageBarComponent extends PositionComponent {
  final Vector2 characterPositionSize;

  EmptyRageBarComponent({
    required this.characterPositionSize,
  });

  SpriteComponent _spriteComponent = SpriteComponent();
  final _rageBarComponent = RageBarComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        rageBgBar,
        images: Images(prefix: ""),
      )
      ..size = Vector2(80, 8);

    scale = Vector2.all(characterPositionSize.x * 0.7 / 100);

    position =
        Vector2(0, characterPositionSize.y - characterPositionSize.y * 2.149);

    priority = 1;

    await _spriteComponent.add(_rageBarComponent);

    await add(_spriteComponent);
    return super.onLoad();
  }

  void changeSize(int value) {
    _rageBarComponent.changeSize(value);
  }

  Future<void> hide() async {
    await _rageBarComponent.hide();
    await _spriteComponent.add(
      OpacityEffect.fadeOut(
        EffectController(duration: 0),
      ),
    );
  }

  Future<void> show() async {
    await _rageBarComponent.show();
    await _spriteComponent.add(
      OpacityEffect.fadeIn(
        EffectController(duration: 0),
      ),
    );
  }
}
