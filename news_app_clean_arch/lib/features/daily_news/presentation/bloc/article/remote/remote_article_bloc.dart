// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_clean_arch/core/resources/data_state.dart';

import 'package:news_app_clean_arch/features/daily_news/domain/usecases/get_articles_usecase.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app_clean_arch/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticlesUsecase _getArticlesUsecase;

  RemoteArticleBloc(this._getArticlesUsecase)
    : super(const RemoteArticleLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
    GetArticles event,
    Emitter<RemoteArticleState> emit,
  ) async {
    final dataState = await _getArticlesUsecase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticleDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteArticleError(dataState.error!));
    }
  }
}
