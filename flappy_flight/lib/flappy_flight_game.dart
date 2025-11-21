import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/component/flappy_flight_root_component.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class FlappyFlightGame extends FlameGame<FlappyFlightWorld> with KeyboardEvents, HasCollisionDetection {
  FlappyFlightGame(this.gameCubit)
    : super(
        world: FlappyFlightWorld(),
        camera: CameraComponent.withFixedResolution(
          width: 600,
          height: 1000,
        ),
      );

  final GameCubit gameCubit;

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
  late FlappyFligthRootComponent _rootComponent;

  @override
  void onLoad() {
    super.onLoad();
    add(
      FlameBlocProvider<GameCubit, GameState>(
        create: () => game.gameCubit,
        children: [
          _rootComponent = FlappyFligthRootComponent(),
        ],
      ),
    );
  }

  void onSpaceDown() {
    _rootComponent.onSpaceDown();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    _rootComponent.onTapDown(event);
  }
}

