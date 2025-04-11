import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/core/usecase/usecase.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/repositories/tv_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class GetPopulartTvUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<TVRepository>().getPopularTV();
  }
}
