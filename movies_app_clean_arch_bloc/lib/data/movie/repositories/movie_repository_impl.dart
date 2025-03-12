import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/mapper/movie_mapper.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/models/movie_model.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/sources/movie_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/repositories/movie_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((item) {
              return MovieMapper.toEntity(MovieModel.fromMap(item));
            }).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((item) {
              return MovieMapper.toEntity(MovieModel.fromMap(item));
            }).toList();
        return Right(movies);
      },
    );
  }
}
