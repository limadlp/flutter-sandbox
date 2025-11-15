import 'package:flame/game.dart';
import 'package:flappy_flight/flappy_flight_game.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyFlightGame _flappyFlightGame;

  @override
  void initState() {
    _flappyFlightGame = FlappyFlightGame();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GameWidget(
        game: _flappyFlightGame,
      ),
    );
  }
}
