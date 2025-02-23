import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthApiService authApiService;
  AuthRepositoryImpl({required this.authApiService});

  @override
  Future<Either> signup(SignupReqParams params) async {
    return await authApiService.signup(params);
  }
}
