import 'package:movies_app_clean_arch_bloc/domain/movie/entities/movie_entity.dart';

abstract class TrendingState {}

class TrendingMoviesLoading extends TrendingState {}

class TrendingMoviesLoaded extends TrendingState {
  final List<MovieEntity> movies;
  TrendingMoviesLoaded({required this.movies});
}

class FailureLoadTrendingMovies extends TrendingState {
  final String errorMessage;
  FailureLoadTrendingMovies({required this.errorMessage});
}
