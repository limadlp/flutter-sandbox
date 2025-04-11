class TvModel {
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? id;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  const TvModel({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    required this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.firstAirDate,
    this.name,
    this.voteAverage,
    this.voteCount,
  });
  factory TvModel.fromMap(Map<String, dynamic> map) {
    return TvModel(
      adult: map['adult'] as bool?,
      backdropPath: map['backdrop_path'] as String?,
      genreIds:
          map['genre_ids'] != null
              ? List<int>.from(map['genre_ids'] as List)
              : null,
      id: map['id'] as int?,
      originCountry:
          map['origin_country'] != null
              ? List<String>.from(map['origin_country'] as List)
              : [],
      originalLanguage: map['original_language'] as String?,
      originalName: map['original_name'] as String?,
      overview: map['overview'] as String?,
      popularity: (map['popularity'] as num?)?.toDouble(),
      posterPath: map['poster_path'] as String?,
      firstAirDate: map['first_air_date'] as String?,
      name: map['name'] as String?,
      voteAverage: (map['vote_average'] as num?)?.toDouble(),
      voteCount: map['vote_count'] as int?,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds,
      'id': id,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_name': originalName,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'first_air_date': firstAirDate,
      'name': name,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
