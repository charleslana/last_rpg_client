import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:last_rpg_client/flame/components/fury_bar_component.dart';

import '../../data/image_data.dart';

class EmptyFuryBarComponent extends PositionComponent {
  final Vector2 characterPositionSize;
  final double characterScale;
  final bool isFlip;

  EmptyFuryBarComponent({
    required this.characterPositionSize,
    required this.characterScale,
    required this.isFlip,
  });

  SpriteComponent _spriteComponent = SpriteComponent();
  final _rageBarComponent = FuryBarComponent();

  @override
  Future<void> onLoad() async {
    _spriteComponent = SpriteComponent()
      ..sprite = await Sprite.load(
        furyBgBar,
        images: Images(prefix: ""),
      )
      ..size = Vector2(80, 8);

    scale = Vector2.all(characterPositionSize.x * 0.7 / 100);

    double pX = 0;

    if (isFlip) {
      pX = characterPositionSize.x * characterScale * 1.2;
    }

    position =
        Vector2(pX, characterPositionSize.y - characterPositionSize.y * 2.149);

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
