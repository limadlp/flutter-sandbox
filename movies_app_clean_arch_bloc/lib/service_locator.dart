import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch_bloc/core/network/dio_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/repositories/auth_repository_impl.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/repositories/movie_repository_impl.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/sources/movie_service.dart';
import 'package:movies_app_clean_arch_bloc/data/tv/repositories/tv_repository_impl.dart';
import 'package:movies_app_clean_arch_bloc/data/tv/sources/tv_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signup_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/repositories/movie_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/repositories/tv_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/usecases/get_popular_tv.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TvService>(TVApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TVRepository>(TvRepositoryImpl());

  // UseCases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
  sl.registerSingleton<GetNowPlayingMoviesUsecase>(
    GetNowPlayingMoviesUsecase(),
  );
  sl.registerSingleton<GetPopulartTvUsecase>(GetPopulartTvUsecase());
}
