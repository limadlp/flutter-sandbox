import 'package:movies_app_clean_arch_bloc/domain/movie/entities/movie_entity.dart';

abstract class TrendingsState {}

class TrendingsMoviesLoading extends TrendingsState {}

class TrendingsMoviesLoaded extends TrendingsState {
  final List<MovieEntity> movies;
  TrendingsMoviesLoaded({required this.movies});
}

class FailureLoadTrendingsMovies extends TrendingsState {
  final String errorMessage;
  FailureLoadTrendingsMovies({required this.errorMessage});
}
