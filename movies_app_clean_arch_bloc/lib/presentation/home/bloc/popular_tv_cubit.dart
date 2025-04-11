import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/domain/tv/usecases/get_popular_tv.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/popular_tv_state.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class PopularTvCubit extends Cubit<PopularTvState> {
  PopularTvCubit() : super(PopularTvLoading());

  void getPopularTv() async {
    var returnedData = await sl<GetPopulartTvUsecase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadPopularTv(errorMessage: error));
      },
      (data) {
        emit(PopularTvLoaded(tv: data));
      },
    );
  }
}
