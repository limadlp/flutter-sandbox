import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/constants/api_url.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_client.dart';
import 'package:movies_app_clean_arch_bloc/core/network/api_exception.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

abstract interface class AuthApiService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either> signup(SignupReqParams params) async {
    try {
      var response = await sl<ApiClient>().post(
        ApiUrl.signup,
        data: params.toMap(),
      );
      if (response.data != null) {
        return Right(response.data);
      } else {
        return Left("Resposta do servidor é nula.");
      }
    } on ApiException catch (e) {
      return Left(e.response?.data['message'] ?? "Erro desconhecido");
    }
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    try {
      var response = await sl<ApiClient>().post(
        ApiUrl.signin,
        data: params.toMap(),
      );
      return Right(response.data);
    } on ApiException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
