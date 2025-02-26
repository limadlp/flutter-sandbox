import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class SigninUsecase extends UseCase<Either, SigninReqParams> {
  @override
  Future<Either> call(SigninReqParams params) async {
    if (params.email.isEmpty || params.password.isEmpty) {
      return Left("Email e senha não podem estar vazios.");
    }

    Either result = await sl<AuthRepository>().signin(params);

    return result;
  }
}
