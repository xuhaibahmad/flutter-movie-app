// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MovieDetailsResponse _$_$_MovieDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return _$_MovieDetailsResponse(
    adult: json['adult'] as bool,
    budget: json['budget'] as int,
    genres: (json['genres'] as List)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    revenue: json['revenue'] as int,
    runtime: json['runtime'] as int,
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    title: json['title'] as String,
    video: json['video'] as bool,
    backdropPath: json['backdrop_path'] as String,
    belongsToCollection: json['belongs_to_collection'],
    imdbId: json['imdb_id'] as String,
    originalLanguage: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    posterPath: json['poster_path'] as String,
    companies: (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompany.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    countries: (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    releaseDate: json['release_date'] as String,
    spokenLanguages: (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    voteAverage: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['vote_count'] as int,
  );
}

Map<String, dynamic> _$_$_MovieDetailsResponseToJson(
        _$_MovieDetailsResponse instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'production_companies': instance.companies,
      'production_countries': instance.countries,
      'release_date': instance.releaseDate,
      'spoken_languages': instance.spokenLanguages,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };

_$_Genre _$_$_GenreFromJson(Map<String, dynamic> json) {
  return _$_Genre(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$_$_GenreToJson(_$_Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$_ProductionCompany _$_$_ProductionCompanyFromJson(Map<String, dynamic> json) {
  return _$_ProductionCompany(
    id: json['id'] as int,
    name: json['name'] as String,
    logoPath: json['logo_path'] as String,
    originCountry: json['origin_country'] as String,
  );
}

Map<String, dynamic> _$_$_ProductionCompanyToJson(
        _$_ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

_$_ProductionCountry _$_$_ProductionCountryFromJson(Map<String, dynamic> json) {
  return _$_ProductionCountry(
    name: json['name'] as String,
    iso31661: json['iso_3166_1'] as String,
  );
}

Map<String, dynamic> _$_$_ProductionCountryToJson(
        _$_ProductionCountry instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iso_3166_1': instance.iso31661,
    };

_$_SpokenLanguage _$_$_SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _$_SpokenLanguage(
    name: json['name'] as String,
    iso6391: json['iso_639_1'] as String,
  );
}

Map<String, dynamic> _$_$_SpokenLanguageToJson(_$_SpokenLanguage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'iso_639_1': instance.iso6391,
    };
