import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/constants/api_url.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_exception.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

abstract interface class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
}

class MovieApiServiceImpl implements MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await sl<ApiClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on ApiException catch (e) {
      return Left(e.message);
    }
  }

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await sl<ApiClient>().get(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    } on ApiException catch (e) {
      return Left(e.message);
    }
  }
}
