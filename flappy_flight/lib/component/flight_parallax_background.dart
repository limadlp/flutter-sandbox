import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/flappy_flight_game.dart';

class FligthParallaxBackground extends ParallaxComponent<FlappyFlightGame> with FlameBlocReader<GameCubit, GameState> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        ParallaxImageData('background/l1_d2.png'),
        ParallaxImageData('background/l2_d.png'),
        ParallaxImageData('background/l3_d.png'),
        ParallaxImageData('background/l4_d.png'),
        ParallaxImageData('background/l6_d.png'),
        ParallaxImageData('background/l5_d.png'),
        ParallaxImageData('background/l7.png'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),
    );
  }

  @override
  void update(double dt) {
    switch (bloc.state.currentPlayingState) {
      case PlayingState.none:
      case PlayingState.playing:
        super.update(dt);
        break;
      case PlayingState.paused:
      case PlayingState.gameOver:
        break;
    }
  }
}
