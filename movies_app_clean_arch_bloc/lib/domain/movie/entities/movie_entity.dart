class MovieEntity {
  final int? id;
  final String? title;
  final String? posterPath;
  final String? backdropPath;
  final String? overview;
  final String? releaseDate;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final bool? adult;
  final String? originalLanguage;
  final String? originalTitle;
  final List<int>? genreIds;
  final bool? video;
  final String? mediaType;

  MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.adult,
    required this.originalLanguage,
    required this.originalTitle,
    required this.genreIds,
    required this.video,
    required this.mediaType,
  });
}
