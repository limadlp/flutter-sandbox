import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/data/auth/models/signin_req_params.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/signin_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/auth/bloc/auth_state.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class AuthCubit extends Cubit<AuthState> {
  final SigninUsecase signinUsecase = sl<SigninUsecase>();

  AuthCubit() : super(AuthInitial());

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    final result = await signinUsecase.call(
      params: SigninReqParams(email: email, password: password),
    );
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (success) => emit(AuthSuccess()),
    );
  }
}
