import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_clean_arch_bloc/domain/movie/usecases/get_trending_movies_usecase.dart';
import 'package:movies_app_clean_arch_bloc/presentation/home/bloc/trending_state.dart';
import 'package:movies_app_clean_arch_bloc/service_locator.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingMoviesLoading());

  void getTrendingMovies() async {
    var returnedData = await sl<GetTrendingMoviesUsecase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadTrendingMovies(errorMessage: error));
      },
      (data) {
        emit(TrendingMoviesLoaded(movies: data));
      },
    );
  }
}
