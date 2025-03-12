import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/now_playing_state.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetNowPlayingMoviesUsecase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadNowPlayingMovies(errorMessage: error));
      },
      (data) {
        emit(NowPlayingMoviesLoaded(movies: data));
      },
    );
  }
}
