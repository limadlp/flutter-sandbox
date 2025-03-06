import 'package:dartz/dartz.dart';

import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/repositories/movie_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class GetTrendingMoviesUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<MovieRepository>().getTrendingMovies();
  }
}
