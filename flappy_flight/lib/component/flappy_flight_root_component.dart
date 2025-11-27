import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/component/flight_parallax_background.dart';
import 'package:flappy_flight/component/pipe_pair.dart';
import 'package:flappy_flight/component/ship.dart';
import 'package:flappy_flight/flappy_flight_game.dart';

class FlappyFligthRootComponent extends Component
    with HasGameReference<FlappyFlightGame>, FlameBlocReader<GameCubit, GameState> {
  late Ship _ship;
  late PipePair _lastPipe;
  static const _pipesDistance = 400.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //debugMode = true;

    add(FligthParallaxBackground());
    add(_ship = Ship(maxY: 1000));
    _generatePipes(fromX: 350);
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

  void _removeLastPipes() {
    final pipes = children.whereType<PipePair>();
    final shouldBeRemoved = max(pipes.length - 5, 0);
    pipes.take(shouldBeRemoved).forEach((pipe) {
      pipe.removeFromParent();
    });
  }

  void onSpaceDown() {
    _checkToStart();
    _ship.jump();
  }

  void onTapDown(TapDownEvent event) {
    _checkToStart();
    _ship.jump();
  }

  void _checkToStart() {
    if (bloc.state.currentPlayingState.isIdle) {
      bloc.startPlaying();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_ship.x >= _lastPipe.x) {
      _generatePipes(
        fromX: _pipesDistance,
      );
      _removeLastPipes();
    }
    //game.camera.viewfinder.zoom = 0.3;
  }
}
