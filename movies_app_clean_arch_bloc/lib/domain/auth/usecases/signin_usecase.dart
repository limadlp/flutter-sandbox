import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';

class SigninUsecase extends UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams? params}) {
    throw UnimplementedError();
  }
}
