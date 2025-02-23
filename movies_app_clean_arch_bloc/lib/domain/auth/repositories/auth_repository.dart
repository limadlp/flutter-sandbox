import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signup_req_params.dart';

abstract interface class AuthRepository {
  Future<Either> signup(SignupReqParams params);
}
