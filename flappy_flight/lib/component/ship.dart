import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/component/hidden_coin.dart';
import 'package:flappy_flight/component/pipe.dart';
import 'package:flappy_flight/flappy_flight_game.dart';

class Ship extends PositionComponent
    with CollisionCallbacks, HasGameReference<FlappyFlightGame>, FlameBlocReader<GameCubit, GameState> {
  final double maxY;
  Ship({required this.maxY})
    : super(
        position: Vector2(0, 0),
        size: Vector2.all(80),
        anchor: Anchor.center,
        priority: 10,
      );

  late Sprite _dashSprite;

  final Vector2 _gravity = Vector2(0, 1400);
  Vector2 _velocity = Vector2(0, 0);
  final Vector2 _jumpForce = Vector2(0, -500);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    _dashSprite = await Sprite.load('ship.png');
    final radius = size.x / 2;
    //final center = size / 2;
    add(
      CircleHitbox(
        radius: radius * 0.8,
        position: Vector2(0, 0),
        // anchor: Anchor.center,
      ),
    );
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);
    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    _velocity += _gravity * dt;
    position += _velocity * dt;

    if (position.y < -maxY) {
      position.y = -maxY;
      _velocity.y = 0;
    } else if (position.y > maxY) {
      position.y = maxY;
      _velocity.y = 0;
    }
  }

  void jump() {
    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    _velocity = _jumpForce;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _dashSprite.render(
      canvas,
      size: size,
    );
  }

  @override
  void onCollision(Set<Vector2> points, PositionComponent other) {
    super.onCollision(points, other);
    if (bloc.state.currentPlayingState != PlayingState.playing) {
      return;
    }
    if (other is HiddenCoin) {
      bloc.increaseScore();
      other.removeFromParent();
    } else if (other is Pipe) {
      bloc.gameOver();
    }
  }
}
