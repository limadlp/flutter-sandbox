import 'package:dartz/dartz.dart';

abstract interface class MovieRepository {
  Future<Either> getTrendingMovies();
}
