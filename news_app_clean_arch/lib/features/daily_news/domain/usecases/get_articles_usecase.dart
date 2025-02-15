import 'package:news_app_clean_arch/features/core/resources/data_state.dart';
import 'package:news_app_clean_arch/features/core/usecases/usecases.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/entities/article.dart';
import 'package:news_app_clean_arch/features/daily_news/domain/repositories/article_repository.dart';

class GetArticlesUsecase
    implements Usecases<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticlesUsecase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call(void params) {
    return _articleRepository.getNewsArticles();
  }
}
