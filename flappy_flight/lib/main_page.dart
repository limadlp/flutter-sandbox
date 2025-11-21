import 'package:flame/game.dart';
import 'package:flappy_flight/bloc/game/game_cubit.dart';
import 'package:flappy_flight/flappy_flight_game.dart';
import 'package:flappy_flight/widget/game_over_widget.dart';
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
    PlayingState? _latestState;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    _flappyFlightGame = FlappyFlightGame(gameCubit);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameCubit, GameState>(
      listener: (context, state) {
        if (state.currentPlayingState == PlayingState.none &&
            _latestState == PlayingState.gameOver) {
          setState(() {
            _flappyFlightGame = FlappyFlightGame(gameCubit);
          });
        }

        _latestState = state.currentPlayingState;
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              GameWidget(game: _flappyFlightGame),
              if (state.currentPlayingState == PlayingState.gameOver) GameOverWidget(),
              if (state.currentPlayingState == PlayingState.none)
                const Align(
                  alignment: Alignment(0, 0.2),
                  child: Text(
                    'PRESS TO START',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
