import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/constants/api_url.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_exception.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

abstract class TvService {
  Future<Either> getPopularTv();

  getTrendingMovies() {}
}

class TVApiServiceImpl extends TvService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<ApiClient>().get(ApiUrl.trendingMovies);
      return Right(response.data);
    } on ApiException catch (e) {
      return Left(e.message);
    }
  }
}
