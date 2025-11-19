import 'package:flame/game.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/flappy_flight_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FlappyFlightGame _flappyFlightGame;
  late GameCubit gameCubit;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyFlightGame = FlappyFlightGame(gameCubit);
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
