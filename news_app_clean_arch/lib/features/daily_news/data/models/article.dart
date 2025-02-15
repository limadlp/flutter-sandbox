import 'package:news_app_clean_arch/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) => ArticleModel(
    author: map['author'] ?? '',
    title: map['title'] ?? '',
    description: map['description'] ?? '',
    url: map['url'] ?? '',
    urlToImage: map['urlToImage'] ?? '',
    publishedAt: map['publishedAt'] ?? '',
    content: map['content'] ?? '',
  );
}
