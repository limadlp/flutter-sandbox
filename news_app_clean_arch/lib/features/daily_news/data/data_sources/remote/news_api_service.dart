import 'package:dio/dio.dart';
import 'package:news_app_clean_arch/features/core/constants/constants.dart';
import 'package:news_app_clean_arch/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("country") String country = "us",
    @Query("category") String category = "business",
    @Query("apiKey") String apiKey = "8d93748d252f4e34902161446252132a",
  });
}
