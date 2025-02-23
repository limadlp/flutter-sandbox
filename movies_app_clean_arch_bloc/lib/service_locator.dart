import 'package:get_it/get_it.dart';
import 'package:movies_app_clean_arch_bloc/core/network/dio_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<ApiClient>(DioClient());
}
