// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class MovieModel {
  final int? id;
  final String? title;
  final String? posterPath;
  //final String? backdropPath;
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

  MovieModel({
    required this.id,
    required this.title,
    required this.posterPath,
    //required this.backdropPath,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'poster_path': posterPath,
      //'backdrop_path': backdropPath,
      'overview': overview,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'popularity': popularity,
      'adult': adult,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'genre_ids': genreIds,
      'video': video,
      'media_type': mediaType,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int?,
      title: map['title'] as String?,
      posterPath: map['poster_path'] as String?,
      //backdropPath: map['backdrop_path'] as String?,
      overview: map['overview'] as String?,
      releaseDate: map['release_date'] as String?,
      voteAverage: map['vote_average']?.toDouble(),
      voteCount: map['vote_count'] as int?,
      popularity: map['popularity']?.toDouble(),
      adult: map['adult'] as bool?,
      originalLanguage: map['original_language'] as String?,
      originalTitle: map['original_title'] as String?,
      genreIds: List<int>.from(map['genre_ids'] ?? []),
      video: map['video'] as bool?,
      mediaType: map['media_type'] as String?,
    );
  }

  factory MovieModel.fromJson(String source) {
    try {
      return MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
    } catch (e) {
      if (source.startsWith('{')) {
        source = source.trim();
      }
      return MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
    }
  }

  String toJson() => json.encode(toMap());
}
