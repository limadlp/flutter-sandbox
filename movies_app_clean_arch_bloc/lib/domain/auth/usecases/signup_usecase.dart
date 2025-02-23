import 'package:dartz/dartz.dart';

import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class SignupUsecase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) {
    return sl<AuthRepository>().signup(params!);
  }
}
