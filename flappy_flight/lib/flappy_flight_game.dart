import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
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

class FlappyFlightWorld extends World {
  @override
  void onLoad() {
    super.onLoad();
    add(FligthBackground());
    add(Ship());
  }
}

class FligthBackground extends ParallaxComponent<FlappyFlightGame> {
  @override
  Future<void> onLoad() async {
    anchor = Anchor.center;
    parallax = await game.loadParallax(
      [
        // ParallaxImageData('background/layer1-sky.png'),
        // ParallaxImageData('background/layer2-clouds.png'),
        // ParallaxImageData('background/layer3-clouds.png'),
        // ParallaxImageData('background/layer4-clouds.png'),
        // ParallaxImageData('background/layer5-huge-clouds.png'),
        ParallaxImageData('background/l1_d2.png'),
        ParallaxImageData('background/l2_d.png'),
        ParallaxImageData('background/l3_d.png'),
        ParallaxImageData('background/l4_d.png'),
        ParallaxImageData('background/l6_d.png'),
        ParallaxImageData('background/l5_d.png'),
        ParallaxImageData('background/l7.png'),
        //ParallaxImageData('background/layer6-bushes.png'),
        //ParallaxImageData('background/layer7-bushes.png'),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.7, 0),
    );
  }
}
