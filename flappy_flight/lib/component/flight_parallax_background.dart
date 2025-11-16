import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flappy_flight/flappy_flight_game.dart';

class FligthParallaxBackground extends ParallaxComponent<FlappyFlightGame> {
  @override
  Future<void> onLoad() async {
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
}