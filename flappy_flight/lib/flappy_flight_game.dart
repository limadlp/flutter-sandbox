import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_flight/component/flight_parallax_background.dart';
import 'package:flappy_flight/component/ship.dart';

class FlappyFlightGame extends FlameGame<FlappyFlightWorld> {
  FlappyFlightGame()
    : super(
        world: FlappyFlightWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000,
        ),
      );
}

class FlappyFlightWorld extends World with TapCallbacks {
  late Ship _ship;

  @override
  void onLoad() {
    super.onLoad();
    add(FligthParallaxBackground());
    add(_ship = Ship());
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _ship.jump();
  }
}
