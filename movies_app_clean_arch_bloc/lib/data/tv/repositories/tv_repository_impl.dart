import 'package:dartz/dartz.dart';
import 'package:movies_app_clean_arch_bloc/common/helpers/mapper/tv_mapper.dart';
import 'package:movies_app_clean_arch_bloc/data/tv/models/tv_model.dart';
import 'package:movies_app_clean_arch_bloc/data/tv/sources/tv_service.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/repositories/tv_repository.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class TvRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TvService>().getPopularTv();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies =
            List.from(data['content']).map((item) {
              return TvMapper.toEntity(TvModel.fromMap(item));
            }).toList();
        return Right(movies);
      },
    );
  }
}
