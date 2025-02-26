import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/splash/bloc/splash_state.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUsecase>().call();
    isLoggedIn ? emit(Authenticated()) : emit(Unauthenticated());
  }
}
