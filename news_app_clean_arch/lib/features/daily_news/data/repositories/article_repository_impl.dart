import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_clean_arch/core/constants/constants.dart';
import 'package:news_app_clean_arch/core/resources/data_state.dart';
import 'package:news_app_clean_arch/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_app_clean_arch/features/daily_news/data/models/article.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: newsAPIKey,
        country: countryQuery,
        category: categoryQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
