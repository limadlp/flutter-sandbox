part of 'game_cubit.dart';

class GameState with EquatableMixin {
  const GameState({
    this.currentScore = 0,
    this.currentPlayingState = PlayingState.idle,
  });

  final int currentScore;
  final PlayingState currentPlayingState;

  @override
  List<Object> get props => [
    currentScore,
    currentPlayingState,
  ];

  GameState copyWith({
    int? currentScore,
    PlayingState? currentPlayingState,
  }) {
    return GameState(
      currentScore: currentScore ?? this.currentScore,
      currentPlayingState: currentPlayingState ?? this.currentPlayingState,
    );
  }
}

enum PlayingState {
  idle,
  playing,
  paused,
  gameOver
  ;

  bool get isPlaying => this == PlayingState.playing;
  bool get isNotPlaying => this != PlayingState.playing;
  bool get isGameOver => this == PlayingState.gameOver;
  bool get isNotGameOver => this != PlayingState.gameOver;
  bool get isIdle => this == PlayingState.idle;
  bool get isPaused => this == PlayingState.paused;
}
