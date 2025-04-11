import 'package:movies_app_clean_arch_bloc/domain/tv/entities/tv_entity.dart';

abstract class PopularTvState {}

class PopularTvLoading extends PopularTvState {}

class PopularTvLoaded extends PopularTvState {
  final List<TvEntity> tv;
  PopularTvLoaded({required this.tv});
}

class FailureLoadPopularTv extends PopularTvState {
  final String errorMessage;
  FailureLoadPopularTv({required this.errorMessage});
}
