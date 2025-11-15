import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';

class Ship extends PositionComponent {
  Ship()
    : super(
        position: Vector2(0, 0),
        size: Vector2.all(80),
        anchor: Anchor.center,
      );

  late Sprite _dashSprite;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //debugMode = true;
    _dashSprite = await Sprite.load('ship.png');
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    position = Vector2.zero();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _dashSprite.render(
      canvas,
      size: size,
    );
  }
}
