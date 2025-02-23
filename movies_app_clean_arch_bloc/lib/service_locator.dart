import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch_bloc/core/network/dio_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signup_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiClient>(DioClient());
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
}
