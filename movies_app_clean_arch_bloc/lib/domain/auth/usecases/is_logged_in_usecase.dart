import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/auth/repositories/auth_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class IsLoggedInUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
