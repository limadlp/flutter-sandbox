import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/sources/auth_api_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either> signup(SignupReqParams params) async {
    var data = await sl<AuthApiService>().signup(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    var data = await sl<AuthApiService>().signin(params);
    return data.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString("token", data['user']['token']);
        return Right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    return token == null ? false : true;
  }
}
