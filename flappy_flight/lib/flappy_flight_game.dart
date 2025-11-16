import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_flight/component/flight_parallax_background.dart';
import 'package:flappy_flight/component/pipe_pair.dart';
import 'package:flappy_flight/component/ship.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FlappyFlightGame extends FlameGame<FlappyFlightWorld> with KeyboardEvents {
  FlappyFlightGame()
    : super(
        world: FlappyFlightWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000,
        ),
      );

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;

    final isSpace = keysPressed.contains(LogicalKeyboardKey.space);

    if (isSpace && isKeyDown) {
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }
}

class FlappyFlightWorld extends World with TapCallbacks, HasGameReference<FlappyFlightGame> {
  late Ship _ship;
  late PipePair _lastPipe;
  static const _pipesDistance = 400.0;

  @override
  void onLoad() {
    super.onLoad();

    add(FligthParallaxBackground());
    add(_ship = Ship(maxY: 1000));
    _generatePipes(fromX: -350);
  }

  void _generatePipes({
    int count = 5,
    double fromX = 0.0,
  }) {
    for (int i = 0; i < count; i++) {
      const area = 600;
      final y = (Random().nextDouble() * area) - (area / 2);
      add(_lastPipe = PipePair(position: Vector2(fromX + i * _pipesDistance, y)));
    }
  }

  void _removePipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length - 5, 0);
    pipes.take(shouldBeRemoved).forEach((pipe) {
      pipe.removeFromParent();
    });
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _ship.jump();
  }

  void onSpaceDown() {
    _ship.jump();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_ship.x >= _lastPipe.x) {
      _generatePipes(
        fromX: _pipesDistance,
      );
      _removePipes();
    }
    //game.camera.viewfinder.zoom = 0.3;
  }
}
