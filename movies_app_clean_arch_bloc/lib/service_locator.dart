import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch_bloc/core/network/dio_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/repositories/auth_repository_impl.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/repositories/movie_repository_impl.dart';
import 'package:movies_app_clean_arch_bloc/data/movie/sources/movie_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signup_usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/repositories/movie_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/usecases/get_trending_movies_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiClient>(DioClient());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  // UseCases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<SigninUsecase>(SigninUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<GetTrendingMoviesUsecase>(GetTrendingMoviesUsecase());
}
