import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';

class FlappyFlightGame extends FlameGame<FlappyFlightWorld> {
  FlappyFlightGame()
    : super(
        world: FlappyFlightWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000,
        ),
      );

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}

class FlappyFlightWorld extends World {
  @override
  void onLoad() {
    super.onLoad();
    add(Ship());
  }
}

class Ship extends PositionComponent {
  Ship()
    : super(
        position: Vector2(0, 0),
        size: Vector2(20, 20),
      );

  @override
  void update(double dt) {
    super.update(dt);
    position = Vector2.zero();
    angle += 0.01;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(
      toRect(),
      BasicPalette.blue.paint(),
    );
  }
}
