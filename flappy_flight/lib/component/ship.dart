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

  final Vector2 _gravity = Vector2(0, 900); 
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, -400);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    //debugMode = true;
    _dashSprite = await Sprite.load('ship.png');
  }

  void jump() {
    _velocity = _jumpForce;
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    _velocity += _gravity * dt;
    position += _velocity * dt;
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
