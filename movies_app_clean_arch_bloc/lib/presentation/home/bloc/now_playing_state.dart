import 'package:movies_app_clean_arch_bloc/domain/movie/entities/movie_entity.dart';

abstract class NowPlayingState {}

class NowPlayingMoviesLoading extends NowPlayingState {}

class NowPlayingMoviesLoaded extends NowPlayingState {
  final List<MovieEntity> movies;
  NowPlayingMoviesLoaded({required this.movies});
}

class FailureLoadNowPlayingMovies extends NowPlayingState {
  final String errorMessage;
  FailureLoadNowPlayingMovies({required this.errorMessage});
}
