import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    return await sl<AuthApiService>().signup(params);
  }

  @override
  Future<Either> signin(SigninReqParams params) {
    return sl<AuthApiService>().signin(params);
  }
}
