// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'movie_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MovieDetailsResponse _$MovieDetailsResponseFromJson(Map<String, dynamic> json) {
  return _MovieDetailsResponse.fromJson(json);
}

class _$MovieDetailsResponseTearOff {
  const _$MovieDetailsResponseTearOff();

  _MovieDetailsResponse call(
      {bool adult,
      int budget,
      List<Genre> genres,
      String homepage,
      int id,
      String overview,
      double popularity,
      int revenue,
      int runtime,
      String status,
      String tagline,
      String title,
      bool video,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'production_companies') List<ProductionCompany> companies,
      @JsonKey(name: 'production_countries') List<ProductionCountry> countries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount}) {
    return _MovieDetailsResponse(
      adult: adult,
      budget: budget,
      genres: genres,
      homepage: homepage,
      id: id,
      overview: overview,
      popularity: popularity,
      revenue: revenue,
      runtime: runtime,
      status: status,
      tagline: tagline,
      title: title,
      video: video,
      backdropPath: backdropPath,
      belongsToCollection: belongsToCollection,
      imdbId: imdbId,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      posterPath: posterPath,
      companies: companies,
      countries: countries,
      releaseDate: releaseDate,
      spokenLanguages: spokenLanguages,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}

// ignore: unused_element
const $MovieDetailsResponse = _$MovieDetailsResponseTearOff();

mixin _$MovieDetailsResponse {
  bool get adult;
  int get budget;
  List<Genre> get genres;
  String get homepage;
  int get id;
  String get overview;
  double get popularity;
  int get revenue;
  int get runtime;
  String get status;
  String get tagline;
  String get title;
  bool get video;
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  dynamic get belongsToCollection;
  @JsonKey(name: 'imdb_id')
  String get imdbId;
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get companies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> get countries;
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> get spokenLanguages;
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @JsonKey(name: 'vote_count')
  int get voteCount;

  Map<String, dynamic> toJson();
  $MovieDetailsResponseCopyWith<MovieDetailsResponse> get copyWith;
}

abstract class $MovieDetailsResponseCopyWith<$Res> {
  factory $MovieDetailsResponseCopyWith(MovieDetailsResponse value,
          $Res Function(MovieDetailsResponse) then) =
      _$MovieDetailsResponseCopyWithImpl<$Res>;
  $Res call(
      {bool adult,
      int budget,
      List<Genre> genres,
      String homepage,
      int id,
      String overview,
      double popularity,
      int revenue,
      int runtime,
      String status,
      String tagline,
      String title,
      bool video,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'production_companies') List<ProductionCompany> companies,
      @JsonKey(name: 'production_countries') List<ProductionCountry> countries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

class _$MovieDetailsResponseCopyWithImpl<$Res>
    implements $MovieDetailsResponseCopyWith<$Res> {
  _$MovieDetailsResponseCopyWithImpl(this._value, this._then);

  final MovieDetailsResponse _value;
  // ignore: unused_field
  final $Res Function(MovieDetailsResponse) _then;

  @override
  $Res call({
    Object adult = freezed,
    Object budget = freezed,
    Object genres = freezed,
    Object homepage = freezed,
    Object id = freezed,
    Object overview = freezed,
    Object popularity = freezed,
    Object revenue = freezed,
    Object runtime = freezed,
    Object status = freezed,
    Object tagline = freezed,
    Object title = freezed,
    Object video = freezed,
    Object backdropPath = freezed,
    Object belongsToCollection = freezed,
    Object imdbId = freezed,
    Object originalLanguage = freezed,
    Object originalTitle = freezed,
    Object posterPath = freezed,
    Object companies = freezed,
    Object countries = freezed,
    Object releaseDate = freezed,
    Object spokenLanguages = freezed,
    Object voteAverage = freezed,
    Object voteCount = freezed,
  }) {
    return _then(_value.copyWith(
      adult: adult == freezed ? _value.adult : adult as bool,
      budget: budget == freezed ? _value.budget : budget as int,
      genres: genres == freezed ? _value.genres : genres as List<Genre>,
      homepage: homepage == freezed ? _value.homepage : homepage as String,
      id: id == freezed ? _value.id : id as int,
      overview: overview == freezed ? _value.overview : overview as String,
      popularity:
          popularity == freezed ? _value.popularity : popularity as double,
      revenue: revenue == freezed ? _value.revenue : revenue as int,
      runtime: runtime == freezed ? _value.runtime : runtime as int,
      status: status == freezed ? _value.status : status as String,
      tagline: tagline == freezed ? _value.tagline : tagline as String,
      title: title == freezed ? _value.title : title as String,
      video: video == freezed ? _value.video : video as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String,
      belongsToCollection: belongsToCollection == freezed
          ? _value.belongsToCollection
          : belongsToCollection as dynamic,
      imdbId: imdbId == freezed ? _value.imdbId : imdbId as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      companies: companies == freezed
          ? _value.companies
          : companies as List<ProductionCompany>,
      countries: countries == freezed
          ? _value.countries
          : countries as List<ProductionCountry>,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String,
      spokenLanguages: spokenLanguages == freezed
          ? _value.spokenLanguages
          : spokenLanguages as List<SpokenLanguage>,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double,
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int,
    ));
  }
}

abstract class _$MovieDetailsResponseCopyWith<$Res>
    implements $MovieDetailsResponseCopyWith<$Res> {
  factory _$MovieDetailsResponseCopyWith(_MovieDetailsResponse value,
          $Res Function(_MovieDetailsResponse) then) =
      __$MovieDetailsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool adult,
      int budget,
      List<Genre> genres,
      String homepage,
      int id,
      String overview,
      double popularity,
      int revenue,
      int runtime,
      String status,
      String tagline,
      String title,
      bool video,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'production_companies') List<ProductionCompany> companies,
      @JsonKey(name: 'production_countries') List<ProductionCountry> countries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount});
}

class __$MovieDetailsResponseCopyWithImpl<$Res>
    extends _$MovieDetailsResponseCopyWithImpl<$Res>
    implements _$MovieDetailsResponseCopyWith<$Res> {
  __$MovieDetailsResponseCopyWithImpl(
      _MovieDetailsResponse _value, $Res Function(_MovieDetailsResponse) _then)
      : super(_value, (v) => _then(v as _MovieDetailsResponse));

  @override
  _MovieDetailsResponse get _value => super._value as _MovieDetailsResponse;

  @override
  $Res call({
    Object adult = freezed,
    Object budget = freezed,
    Object genres = freezed,
    Object homepage = freezed,
    Object id = freezed,
    Object overview = freezed,
    Object popularity = freezed,
    Object revenue = freezed,
    Object runtime = freezed,
    Object status = freezed,
    Object tagline = freezed,
    Object title = freezed,
    Object video = freezed,
    Object backdropPath = freezed,
    Object belongsToCollection = freezed,
    Object imdbId = freezed,
    Object originalLanguage = freezed,
    Object originalTitle = freezed,
    Object posterPath = freezed,
    Object companies = freezed,
    Object countries = freezed,
    Object releaseDate = freezed,
    Object spokenLanguages = freezed,
    Object voteAverage = freezed,
    Object voteCount = freezed,
  }) {
    return _then(_MovieDetailsResponse(
      adult: adult == freezed ? _value.adult : adult as bool,
      budget: budget == freezed ? _value.budget : budget as int,
      genres: genres == freezed ? _value.genres : genres as List<Genre>,
      homepage: homepage == freezed ? _value.homepage : homepage as String,
      id: id == freezed ? _value.id : id as int,
      overview: overview == freezed ? _value.overview : overview as String,
      popularity:
          popularity == freezed ? _value.popularity : popularity as double,
      revenue: revenue == freezed ? _value.revenue : revenue as int,
      runtime: runtime == freezed ? _value.runtime : runtime as int,
      status: status == freezed ? _value.status : status as String,
      tagline: tagline == freezed ? _value.tagline : tagline as String,
      title: title == freezed ? _value.title : title as String,
      video: video == freezed ? _value.video : video as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String,
      belongsToCollection: belongsToCollection == freezed
          ? _value.belongsToCollection
          : belongsToCollection as dynamic,
      imdbId: imdbId == freezed ? _value.imdbId : imdbId as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      companies: companies == freezed
          ? _value.companies
          : companies as List<ProductionCompany>,
      countries: countries == freezed
          ? _value.countries
          : countries as List<ProductionCountry>,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String,
      spokenLanguages: spokenLanguages == freezed
          ? _value.spokenLanguages
          : spokenLanguages as List<SpokenLanguage>,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double,
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int,
    ));
  }
}

@JsonSerializable()
class _$_MovieDetailsResponse implements _MovieDetailsResponse {
  _$_MovieDetailsResponse(
      {this.adult,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.overview,
      this.popularity,
      this.revenue,
      this.runtime,
      this.status,
      this.tagline,
      this.title,
      this.video,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'belongs_to_collection') this.belongsToCollection,
      @JsonKey(name: 'imdb_id') this.imdbId,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'production_companies') this.companies,
      @JsonKey(name: 'production_countries') this.countries,
      @JsonKey(name: 'release_date') this.releaseDate,
      @JsonKey(name: 'spoken_languages') this.spokenLanguages,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'vote_count') this.voteCount});

  factory _$_MovieDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MovieDetailsResponseFromJson(json);

  @override
  final bool adult;
  @override
  final int budget;
  @override
  final List<Genre> genres;
  @override
  final String homepage;
  @override
  final int id;
  @override
  final String overview;
  @override
  final double popularity;
  @override
  final int revenue;
  @override
  final int runtime;
  @override
  final String status;
  @override
  final String tagline;
  @override
  final String title;
  @override
  final bool video;
  @override
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @override
  @JsonKey(name: 'belongs_to_collection')
  final dynamic belongsToCollection;
  @override
  @JsonKey(name: 'imdb_id')
  final String imdbId;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> companies;
  @override
  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> countries;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @override
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @override
  String toString() {
    return 'MovieDetailsResponse(adult: $adult, budget: $budget, genres: $genres, homepage: $homepage, id: $id, overview: $overview, popularity: $popularity, revenue: $revenue, runtime: $runtime, status: $status, tagline: $tagline, title: $title, video: $video, backdropPath: $backdropPath, belongsToCollection: $belongsToCollection, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, posterPath: $posterPath, companies: $companies, countries: $countries, releaseDate: $releaseDate, spokenLanguages: $spokenLanguages, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MovieDetailsResponse &&
            (identical(other.adult, adult) ||
                const DeepCollectionEquality().equals(other.adult, adult)) &&
            (identical(other.budget, budget) ||
                const DeepCollectionEquality().equals(other.budget, budget)) &&
            (identical(other.genres, genres) ||
                const DeepCollectionEquality().equals(other.genres, genres)) &&
            (identical(other.homepage, homepage) ||
                const DeepCollectionEquality()
                    .equals(other.homepage, homepage)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.overview, overview) ||
                const DeepCollectionEquality()
                    .equals(other.overview, overview)) &&
            (identical(other.popularity, popularity) ||
                const DeepCollectionEquality()
                    .equals(other.popularity, popularity)) &&
            (identical(other.revenue, revenue) ||
                const DeepCollectionEquality()
                    .equals(other.revenue, revenue)) &&
            (identical(other.runtime, runtime) ||
                const DeepCollectionEquality()
                    .equals(other.runtime, runtime)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.tagline, tagline) ||
                const DeepCollectionEquality()
                    .equals(other.tagline, tagline)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.backdropPath, backdropPath) ||
                const DeepCollectionEquality()
                    .equals(other.backdropPath, backdropPath)) &&
            (identical(other.belongsToCollection, belongsToCollection) ||
                const DeepCollectionEquality()
                    .equals(other.belongsToCollection, belongsToCollection)) &&
            (identical(other.imdbId, imdbId) ||
                const DeepCollectionEquality().equals(other.imdbId, imdbId)) &&
            (identical(other.originalLanguage, originalLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.originalLanguage, originalLanguage)) &&
            (identical(other.originalTitle, originalTitle) ||
                const DeepCollectionEquality()
                    .equals(other.originalTitle, originalTitle)) &&
            (identical(other.posterPath, posterPath) ||
                const DeepCollectionEquality()
                    .equals(other.posterPath, posterPath)) &&
            (identical(other.companies, companies) ||
                const DeepCollectionEquality()
                    .equals(other.companies, companies)) &&
            (identical(other.countries, countries) ||
                const DeepCollectionEquality()
                    .equals(other.countries, countries)) &&
            (identical(other.releaseDate, releaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.releaseDate, releaseDate)) &&
            (identical(other.spokenLanguages, spokenLanguages) ||
                const DeepCollectionEquality()
                    .equals(other.spokenLanguages, spokenLanguages)) &&
            (identical(other.voteAverage, voteAverage) ||
                const DeepCollectionEquality()
                    .equals(other.voteAverage, voteAverage)) &&
            (identical(other.voteCount, voteCount) ||
                const DeepCollectionEquality()
                    .equals(other.voteCount, voteCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(adult) ^
      const DeepCollectionEquality().hash(budget) ^
      const DeepCollectionEquality().hash(genres) ^
      const DeepCollectionEquality().hash(homepage) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(overview) ^
      const DeepCollectionEquality().hash(popularity) ^
      const DeepCollectionEquality().hash(revenue) ^
      const DeepCollectionEquality().hash(runtime) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(tagline) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(backdropPath) ^
      const DeepCollectionEquality().hash(belongsToCollection) ^
      const DeepCollectionEquality().hash(imdbId) ^
      const DeepCollectionEquality().hash(originalLanguage) ^
      const DeepCollectionEquality().hash(originalTitle) ^
      const DeepCollectionEquality().hash(posterPath) ^
      const DeepCollectionEquality().hash(companies) ^
      const DeepCollectionEquality().hash(countries) ^
      const DeepCollectionEquality().hash(releaseDate) ^
      const DeepCollectionEquality().hash(spokenLanguages) ^
      const DeepCollectionEquality().hash(voteAverage) ^
      const DeepCollectionEquality().hash(voteCount);

  @override
  _$MovieDetailsResponseCopyWith<_MovieDetailsResponse> get copyWith =>
      __$MovieDetailsResponseCopyWithImpl<_MovieDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MovieDetailsResponseToJson(this);
  }
}

abstract class _MovieDetailsResponse implements MovieDetailsResponse {
  factory _MovieDetailsResponse(
      {bool adult,
      int budget,
      List<Genre> genres,
      String homepage,
      int id,
      String overview,
      double popularity,
      int revenue,
      int runtime,
      String status,
      String tagline,
      String title,
      bool video,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'belongs_to_collection') dynamic belongsToCollection,
      @JsonKey(name: 'imdb_id') String imdbId,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'production_companies') List<ProductionCompany> companies,
      @JsonKey(name: 'production_countries') List<ProductionCountry> countries,
      @JsonKey(name: 'release_date') String releaseDate,
      @JsonKey(name: 'spoken_languages') List<SpokenLanguage> spokenLanguages,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'vote_count') int voteCount}) = _$_MovieDetailsResponse;

  factory _MovieDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieDetailsResponse.fromJson;

  @override
  bool get adult;
  @override
  int get budget;
  @override
  List<Genre> get genres;
  @override
  String get homepage;
  @override
  int get id;
  @override
  String get overview;
  @override
  double get popularity;
  @override
  int get revenue;
  @override
  int get runtime;
  @override
  String get status;
  @override
  String get tagline;
  @override
  String get title;
  @override
  bool get video;
  @override
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @override
  @JsonKey(name: 'belongs_to_collection')
  dynamic get belongsToCollection;
  @override
  @JsonKey(name: 'imdb_id')
  String get imdbId;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> get companies;
  @override
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> get countries;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> get spokenLanguages;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'vote_count')
  int get voteCount;
  @override
  _$MovieDetailsResponseCopyWith<_MovieDetailsResponse> get copyWith;
}

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return _Genre.fromJson(json);
}

class _$GenreTearOff {
  const _$GenreTearOff();

  _Genre call({int id, String name}) {
    return _Genre(
      id: id,
      name: name,
    );
  }
}

// ignore: unused_element
const $Genre = _$GenreTearOff();

mixin _$Genre {
  int get id;
  String get name;

  Map<String, dynamic> toJson();
  $GenreCopyWith<Genre> get copyWith;
}

abstract class $GenreCopyWith<$Res> {
  factory $GenreCopyWith(Genre value, $Res Function(Genre) then) =
      _$GenreCopyWithImpl<$Res>;
  $Res call({int id, String name});
}

class _$GenreCopyWithImpl<$Res> implements $GenreCopyWith<$Res> {
  _$GenreCopyWithImpl(this._value, this._then);

  final Genre _value;
  // ignore: unused_field
  final $Res Function(Genre) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

abstract class _$GenreCopyWith<$Res> implements $GenreCopyWith<$Res> {
  factory _$GenreCopyWith(_Genre value, $Res Function(_Genre) then) =
      __$GenreCopyWithImpl<$Res>;
  @override
  $Res call({int id, String name});
}

class __$GenreCopyWithImpl<$Res> extends _$GenreCopyWithImpl<$Res>
    implements _$GenreCopyWith<$Res> {
  __$GenreCopyWithImpl(_Genre _value, $Res Function(_Genre) _then)
      : super(_value, (v) => _then(v as _Genre));

  @override
  _Genre get _value => super._value as _Genre;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
  }) {
    return _then(_Genre(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
    ));
  }
}

@JsonSerializable()
class _$_Genre implements _Genre {
  _$_Genre({this.id, this.name});

  factory _$_Genre.fromJson(Map<String, dynamic> json) =>
      _$_$_GenreFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Genre(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Genre &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name);

  @override
  _$GenreCopyWith<_Genre> get copyWith =>
      __$GenreCopyWithImpl<_Genre>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenreToJson(this);
  }
}

abstract class _Genre implements Genre {
  factory _Genre({int id, String name}) = _$_Genre;

  factory _Genre.fromJson(Map<String, dynamic> json) = _$_Genre.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  _$GenreCopyWith<_Genre> get copyWith;
}

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) {
  return _ProductionCompany.fromJson(json);
}

class _$ProductionCompanyTearOff {
  const _$ProductionCompanyTearOff();

  _ProductionCompany call(
      {int id,
      String name,
      @JsonKey(name: 'logo_path') String logoPath,
      @JsonKey(name: 'origin_country') String originCountry}) {
    return _ProductionCompany(
      id: id,
      name: name,
      logoPath: logoPath,
      originCountry: originCountry,
    );
  }
}

// ignore: unused_element
const $ProductionCompany = _$ProductionCompanyTearOff();

mixin _$ProductionCompany {
  int get id;
  String get name;
  @JsonKey(name: 'logo_path')
  String get logoPath;
  @JsonKey(name: 'origin_country')
  String get originCountry;

  Map<String, dynamic> toJson();
  $ProductionCompanyCopyWith<ProductionCompany> get copyWith;
}

abstract class $ProductionCompanyCopyWith<$Res> {
  factory $ProductionCompanyCopyWith(
          ProductionCompany value, $Res Function(ProductionCompany) then) =
      _$ProductionCompanyCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'logo_path') String logoPath,
      @JsonKey(name: 'origin_country') String originCountry});
}

class _$ProductionCompanyCopyWithImpl<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  _$ProductionCompanyCopyWithImpl(this._value, this._then);

  final ProductionCompany _value;
  // ignore: unused_field
  final $Res Function(ProductionCompany) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object logoPath = freezed,
    Object originCountry = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      logoPath: logoPath == freezed ? _value.logoPath : logoPath as String,
      originCountry: originCountry == freezed
          ? _value.originCountry
          : originCountry as String,
    ));
  }
}

abstract class _$ProductionCompanyCopyWith<$Res>
    implements $ProductionCompanyCopyWith<$Res> {
  factory _$ProductionCompanyCopyWith(
          _ProductionCompany value, $Res Function(_ProductionCompany) then) =
      __$ProductionCompanyCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'logo_path') String logoPath,
      @JsonKey(name: 'origin_country') String originCountry});
}

class __$ProductionCompanyCopyWithImpl<$Res>
    extends _$ProductionCompanyCopyWithImpl<$Res>
    implements _$ProductionCompanyCopyWith<$Res> {
  __$ProductionCompanyCopyWithImpl(
      _ProductionCompany _value, $Res Function(_ProductionCompany) _then)
      : super(_value, (v) => _then(v as _ProductionCompany));

  @override
  _ProductionCompany get _value => super._value as _ProductionCompany;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object logoPath = freezed,
    Object originCountry = freezed,
  }) {
    return _then(_ProductionCompany(
      id: id == freezed ? _value.id : id as int,
      name: name == freezed ? _value.name : name as String,
      logoPath: logoPath == freezed ? _value.logoPath : logoPath as String,
      originCountry: originCountry == freezed
          ? _value.originCountry
          : originCountry as String,
    ));
  }
}

@JsonSerializable()
class _$_ProductionCompany implements _ProductionCompany {
  _$_ProductionCompany(
      {this.id,
      this.name,
      @JsonKey(name: 'logo_path') this.logoPath,
      @JsonKey(name: 'origin_country') this.originCountry});

  factory _$_ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductionCompanyFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'logo_path')
  final String logoPath;
  @override
  @JsonKey(name: 'origin_country')
  final String originCountry;

  @override
  String toString() {
    return 'ProductionCompany(id: $id, name: $name, logoPath: $logoPath, originCountry: $originCountry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductionCompany &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.logoPath, logoPath) ||
                const DeepCollectionEquality()
                    .equals(other.logoPath, logoPath)) &&
            (identical(other.originCountry, originCountry) ||
                const DeepCollectionEquality()
                    .equals(other.originCountry, originCountry)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(logoPath) ^
      const DeepCollectionEquality().hash(originCountry);

  @override
  _$ProductionCompanyCopyWith<_ProductionCompany> get copyWith =>
      __$ProductionCompanyCopyWithImpl<_ProductionCompany>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductionCompanyToJson(this);
  }
}

abstract class _ProductionCompany implements ProductionCompany {
  factory _ProductionCompany(
          {int id,
          String name,
          @JsonKey(name: 'logo_path') String logoPath,
          @JsonKey(name: 'origin_country') String originCountry}) =
      _$_ProductionCompany;

  factory _ProductionCompany.fromJson(Map<String, dynamic> json) =
      _$_ProductionCompany.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'logo_path')
  String get logoPath;
  @override
  @JsonKey(name: 'origin_country')
  String get originCountry;
  @override
  _$ProductionCompanyCopyWith<_ProductionCompany> get copyWith;
}

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) {
  return _ProductionCountry.fromJson(json);
}

class _$ProductionCountryTearOff {
  const _$ProductionCountryTearOff();

  _ProductionCountry call(
      {String name, @JsonKey(name: 'iso_3166_1') String iso31661}) {
    return _ProductionCountry(
      name: name,
      iso31661: iso31661,
    );
  }
}

// ignore: unused_element
const $ProductionCountry = _$ProductionCountryTearOff();

mixin _$ProductionCountry {
  String get name;
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;

  Map<String, dynamic> toJson();
  $ProductionCountryCopyWith<ProductionCountry> get copyWith;
}

abstract class $ProductionCountryCopyWith<$Res> {
  factory $ProductionCountryCopyWith(
          ProductionCountry value, $Res Function(ProductionCountry) then) =
      _$ProductionCountryCopyWithImpl<$Res>;
  $Res call({String name, @JsonKey(name: 'iso_3166_1') String iso31661});
}

class _$ProductionCountryCopyWithImpl<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  _$ProductionCountryCopyWithImpl(this._value, this._then);

  final ProductionCountry _value;
  // ignore: unused_field
  final $Res Function(ProductionCountry) _then;

  @override
  $Res call({
    Object name = freezed,
    Object iso31661 = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      iso31661: iso31661 == freezed ? _value.iso31661 : iso31661 as String,
    ));
  }
}

abstract class _$ProductionCountryCopyWith<$Res>
    implements $ProductionCountryCopyWith<$Res> {
  factory _$ProductionCountryCopyWith(
          _ProductionCountry value, $Res Function(_ProductionCountry) then) =
      __$ProductionCountryCopyWithImpl<$Res>;
  @override
  $Res call({String name, @JsonKey(name: 'iso_3166_1') String iso31661});
}

class __$ProductionCountryCopyWithImpl<$Res>
    extends _$ProductionCountryCopyWithImpl<$Res>
    implements _$ProductionCountryCopyWith<$Res> {
  __$ProductionCountryCopyWithImpl(
      _ProductionCountry _value, $Res Function(_ProductionCountry) _then)
      : super(_value, (v) => _then(v as _ProductionCountry));

  @override
  _ProductionCountry get _value => super._value as _ProductionCountry;

  @override
  $Res call({
    Object name = freezed,
    Object iso31661 = freezed,
  }) {
    return _then(_ProductionCountry(
      name: name == freezed ? _value.name : name as String,
      iso31661: iso31661 == freezed ? _value.iso31661 : iso31661 as String,
    ));
  }
}

@JsonSerializable()
class _$_ProductionCountry implements _ProductionCountry {
  _$_ProductionCountry({this.name, @JsonKey(name: 'iso_3166_1') this.iso31661});

  factory _$_ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductionCountryFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'iso_3166_1')
  final String iso31661;

  @override
  String toString() {
    return 'ProductionCountry(name: $name, iso31661: $iso31661)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductionCountry &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.iso31661, iso31661) ||
                const DeepCollectionEquality()
                    .equals(other.iso31661, iso31661)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(iso31661);

  @override
  _$ProductionCountryCopyWith<_ProductionCountry> get copyWith =>
      __$ProductionCountryCopyWithImpl<_ProductionCountry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductionCountryToJson(this);
  }
}

abstract class _ProductionCountry implements ProductionCountry {
  factory _ProductionCountry(
      {String name,
      @JsonKey(name: 'iso_3166_1') String iso31661}) = _$_ProductionCountry;

  factory _ProductionCountry.fromJson(Map<String, dynamic> json) =
      _$_ProductionCountry.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'iso_3166_1')
  String get iso31661;
  @override
  _$ProductionCountryCopyWith<_ProductionCountry> get copyWith;
}

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) {
  return _SpokenLanguage.fromJson(json);
}

class _$SpokenLanguageTearOff {
  const _$SpokenLanguageTearOff();

  _SpokenLanguage call(
      {String name, @JsonKey(name: 'iso_639_1') String iso6391}) {
    return _SpokenLanguage(
      name: name,
      iso6391: iso6391,
    );
  }
}

// ignore: unused_element
const $SpokenLanguage = _$SpokenLanguageTearOff();

mixin _$SpokenLanguage {
  String get name;
  @JsonKey(name: 'iso_639_1')
  String get iso6391;

  Map<String, dynamic> toJson();
  $SpokenLanguageCopyWith<SpokenLanguage> get copyWith;
}

abstract class $SpokenLanguageCopyWith<$Res> {
  factory $SpokenLanguageCopyWith(
          SpokenLanguage value, $Res Function(SpokenLanguage) then) =
      _$SpokenLanguageCopyWithImpl<$Res>;
  $Res call({String name, @JsonKey(name: 'iso_639_1') String iso6391});
}

class _$SpokenLanguageCopyWithImpl<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  _$SpokenLanguageCopyWithImpl(this._value, this._then);

  final SpokenLanguage _value;
  // ignore: unused_field
  final $Res Function(SpokenLanguage) _then;

  @override
  $Res call({
    Object name = freezed,
    Object iso6391 = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      iso6391: iso6391 == freezed ? _value.iso6391 : iso6391 as String,
    ));
  }
}

abstract class _$SpokenLanguageCopyWith<$Res>
    implements $SpokenLanguageCopyWith<$Res> {
  factory _$SpokenLanguageCopyWith(
          _SpokenLanguage value, $Res Function(_SpokenLanguage) then) =
      __$SpokenLanguageCopyWithImpl<$Res>;
  @override
  $Res call({String name, @JsonKey(name: 'iso_639_1') String iso6391});
}

class __$SpokenLanguageCopyWithImpl<$Res>
    extends _$SpokenLanguageCopyWithImpl<$Res>
    implements _$SpokenLanguageCopyWith<$Res> {
  __$SpokenLanguageCopyWithImpl(
      _SpokenLanguage _value, $Res Function(_SpokenLanguage) _then)
      : super(_value, (v) => _then(v as _SpokenLanguage));

  @override
  _SpokenLanguage get _value => super._value as _SpokenLanguage;

  @override
  $Res call({
    Object name = freezed,
    Object iso6391 = freezed,
  }) {
    return _then(_SpokenLanguage(
      name: name == freezed ? _value.name : name as String,
      iso6391: iso6391 == freezed ? _value.iso6391 : iso6391 as String,
    ));
  }
}

@JsonSerializable()
class _$_SpokenLanguage implements _SpokenLanguage {
  _$_SpokenLanguage({this.name, @JsonKey(name: 'iso_639_1') this.iso6391});

  factory _$_SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$_$_SpokenLanguageFromJson(json);

  @override
  final String name;
  @override
  @JsonKey(name: 'iso_639_1')
  final String iso6391;

  @override
  String toString() {
    return 'SpokenLanguage(name: $name, iso6391: $iso6391)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpokenLanguage &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.iso6391, iso6391) ||
                const DeepCollectionEquality().equals(other.iso6391, iso6391)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(iso6391);

  @override
  _$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith =>
      __$SpokenLanguageCopyWithImpl<_SpokenLanguage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpokenLanguageToJson(this);
  }
}

abstract class _SpokenLanguage implements SpokenLanguage {
  factory _SpokenLanguage(
      {String name,
      @JsonKey(name: 'iso_639_1') String iso6391}) = _$_SpokenLanguage;

  factory _SpokenLanguage.fromJson(Map<String, dynamic> json) =
      _$_SpokenLanguage.fromJson;

  @override
  String get name;
  @override
  @JsonKey(name: 'iso_639_1')
  String get iso6391;
  @override
  _$SpokenLanguageCopyWith<_SpokenLanguage> get copyWith;
}
