// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'movie_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MovieListResponse _$MovieListResponseFromJson(Map<String, dynamic> json) {
  return _MovieListResponse.fromJson(json);
}

class _$MovieListResponseTearOff {
  const _$MovieListResponseTearOff();

  _MovieListResponse call(
      {@JsonKey(name: 'results') List<Item> results,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'dates') Dates dates,
      @JsonKey(name: 'total_pages') int totalPages}) {
    return _MovieListResponse(
      results: results,
      page: page,
      totalResults: totalResults,
      dates: dates,
      totalPages: totalPages,
    );
  }
}

// ignore: unused_element
const $MovieListResponse = _$MovieListResponseTearOff();

mixin _$MovieListResponse {
  @JsonKey(name: 'results')
  List<Item> get results;
  @JsonKey(name: 'page')
  int get page;
  @JsonKey(name: 'total_results')
  int get totalResults;
  @JsonKey(name: 'dates')
  Dates get dates;
  @JsonKey(name: 'total_pages')
  int get totalPages;

  Map<String, dynamic> toJson();
  $MovieListResponseCopyWith<MovieListResponse> get copyWith;
}

abstract class $MovieListResponseCopyWith<$Res> {
  factory $MovieListResponseCopyWith(
          MovieListResponse value, $Res Function(MovieListResponse) then) =
      _$MovieListResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'results') List<Item> results,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'dates') Dates dates,
      @JsonKey(name: 'total_pages') int totalPages});

  $DatesCopyWith<$Res> get dates;
}

class _$MovieListResponseCopyWithImpl<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  _$MovieListResponseCopyWithImpl(this._value, this._then);

  final MovieListResponse _value;
  // ignore: unused_field
  final $Res Function(MovieListResponse) _then;

  @override
  $Res call({
    Object results = freezed,
    Object page = freezed,
    Object totalResults = freezed,
    Object dates = freezed,
    Object totalPages = freezed,
  }) {
    return _then(_value.copyWith(
      results: results == freezed ? _value.results : results as List<Item>,
      page: page == freezed ? _value.page : page as int,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      dates: dates == freezed ? _value.dates : dates as Dates,
      totalPages: totalPages == freezed ? _value.totalPages : totalPages as int,
    ));
  }

  @override
  $DatesCopyWith<$Res> get dates {
    if (_value.dates == null) {
      return null;
    }
    return $DatesCopyWith<$Res>(_value.dates, (value) {
      return _then(_value.copyWith(dates: value));
    });
  }
}

abstract class _$MovieListResponseCopyWith<$Res>
    implements $MovieListResponseCopyWith<$Res> {
  factory _$MovieListResponseCopyWith(
          _MovieListResponse value, $Res Function(_MovieListResponse) then) =
      __$MovieListResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'results') List<Item> results,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'dates') Dates dates,
      @JsonKey(name: 'total_pages') int totalPages});

  @override
  $DatesCopyWith<$Res> get dates;
}

class __$MovieListResponseCopyWithImpl<$Res>
    extends _$MovieListResponseCopyWithImpl<$Res>
    implements _$MovieListResponseCopyWith<$Res> {
  __$MovieListResponseCopyWithImpl(
      _MovieListResponse _value, $Res Function(_MovieListResponse) _then)
      : super(_value, (v) => _then(v as _MovieListResponse));

  @override
  _MovieListResponse get _value => super._value as _MovieListResponse;

  @override
  $Res call({
    Object results = freezed,
    Object page = freezed,
    Object totalResults = freezed,
    Object dates = freezed,
    Object totalPages = freezed,
  }) {
    return _then(_MovieListResponse(
      results: results == freezed ? _value.results : results as List<Item>,
      page: page == freezed ? _value.page : page as int,
      totalResults:
          totalResults == freezed ? _value.totalResults : totalResults as int,
      dates: dates == freezed ? _value.dates : dates as Dates,
      totalPages: totalPages == freezed ? _value.totalPages : totalPages as int,
    ));
  }
}

@JsonSerializable()
class _$_MovieListResponse implements _MovieListResponse {
  _$_MovieListResponse(
      {@JsonKey(name: 'results') this.results,
      @JsonKey(name: 'page') this.page,
      @JsonKey(name: 'total_results') this.totalResults,
      @JsonKey(name: 'dates') this.dates,
      @JsonKey(name: 'total_pages') this.totalPages});

  factory _$_MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_MovieListResponseFromJson(json);

  @override
  @JsonKey(name: 'results')
  final List<Item> results;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  @override
  @JsonKey(name: 'dates')
  final Dates dates;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @override
  String toString() {
    return 'MovieListResponse(results: $results, page: $page, totalResults: $totalResults, dates: $dates, totalPages: $totalPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MovieListResponse &&
            (identical(other.results, results) ||
                const DeepCollectionEquality()
                    .equals(other.results, results)) &&
            (identical(other.page, page) ||
                const DeepCollectionEquality().equals(other.page, page)) &&
            (identical(other.totalResults, totalResults) ||
                const DeepCollectionEquality()
                    .equals(other.totalResults, totalResults)) &&
            (identical(other.dates, dates) ||
                const DeepCollectionEquality().equals(other.dates, dates)) &&
            (identical(other.totalPages, totalPages) ||
                const DeepCollectionEquality()
                    .equals(other.totalPages, totalPages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(results) ^
      const DeepCollectionEquality().hash(page) ^
      const DeepCollectionEquality().hash(totalResults) ^
      const DeepCollectionEquality().hash(dates) ^
      const DeepCollectionEquality().hash(totalPages);

  @override
  _$MovieListResponseCopyWith<_MovieListResponse> get copyWith =>
      __$MovieListResponseCopyWithImpl<_MovieListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MovieListResponseToJson(this);
  }
}

abstract class _MovieListResponse implements MovieListResponse {
  factory _MovieListResponse(
      {@JsonKey(name: 'results') List<Item> results,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'total_results') int totalResults,
      @JsonKey(name: 'dates') Dates dates,
      @JsonKey(name: 'total_pages') int totalPages}) = _$_MovieListResponse;

  factory _MovieListResponse.fromJson(Map<String, dynamic> json) =
      _$_MovieListResponse.fromJson;

  @override
  @JsonKey(name: 'results')
  List<Item> get results;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'total_results')
  int get totalResults;
  @override
  @JsonKey(name: 'dates')
  Dates get dates;
  @override
  @JsonKey(name: 'total_pages')
  int get totalPages;
  @override
  _$MovieListResponseCopyWith<_MovieListResponse> get copyWith;
}

Dates _$DatesFromJson(Map<String, dynamic> json) {
  return _Dates.fromJson(json);
}

class _$DatesTearOff {
  const _$DatesTearOff();

  _Dates call(
      {@JsonKey(name: 'maximum') String maximum,
      @JsonKey(name: 'minimum') String minimum}) {
    return _Dates(
      maximum: maximum,
      minimum: minimum,
    );
  }
}

// ignore: unused_element
const $Dates = _$DatesTearOff();

mixin _$Dates {
  @JsonKey(name: 'maximum')
  String get maximum;
  @JsonKey(name: 'minimum')
  String get minimum;

  Map<String, dynamic> toJson();
  $DatesCopyWith<Dates> get copyWith;
}

abstract class $DatesCopyWith<$Res> {
  factory $DatesCopyWith(Dates value, $Res Function(Dates) then) =
      _$DatesCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'maximum') String maximum,
      @JsonKey(name: 'minimum') String minimum});
}

class _$DatesCopyWithImpl<$Res> implements $DatesCopyWith<$Res> {
  _$DatesCopyWithImpl(this._value, this._then);

  final Dates _value;
  // ignore: unused_field
  final $Res Function(Dates) _then;

  @override
  $Res call({
    Object maximum = freezed,
    Object minimum = freezed,
  }) {
    return _then(_value.copyWith(
      maximum: maximum == freezed ? _value.maximum : maximum as String,
      minimum: minimum == freezed ? _value.minimum : minimum as String,
    ));
  }
}

abstract class _$DatesCopyWith<$Res> implements $DatesCopyWith<$Res> {
  factory _$DatesCopyWith(_Dates value, $Res Function(_Dates) then) =
      __$DatesCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'maximum') String maximum,
      @JsonKey(name: 'minimum') String minimum});
}

class __$DatesCopyWithImpl<$Res> extends _$DatesCopyWithImpl<$Res>
    implements _$DatesCopyWith<$Res> {
  __$DatesCopyWithImpl(_Dates _value, $Res Function(_Dates) _then)
      : super(_value, (v) => _then(v as _Dates));

  @override
  _Dates get _value => super._value as _Dates;

  @override
  $Res call({
    Object maximum = freezed,
    Object minimum = freezed,
  }) {
    return _then(_Dates(
      maximum: maximum == freezed ? _value.maximum : maximum as String,
      minimum: minimum == freezed ? _value.minimum : minimum as String,
    ));
  }
}

@JsonSerializable()
class _$_Dates implements _Dates {
  _$_Dates(
      {@JsonKey(name: 'maximum') this.maximum,
      @JsonKey(name: 'minimum') this.minimum});

  factory _$_Dates.fromJson(Map<String, dynamic> json) =>
      _$_$_DatesFromJson(json);

  @override
  @JsonKey(name: 'maximum')
  final String maximum;
  @override
  @JsonKey(name: 'minimum')
  final String minimum;

  @override
  String toString() {
    return 'Dates(maximum: $maximum, minimum: $minimum)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Dates &&
            (identical(other.maximum, maximum) ||
                const DeepCollectionEquality()
                    .equals(other.maximum, maximum)) &&
            (identical(other.minimum, minimum) ||
                const DeepCollectionEquality().equals(other.minimum, minimum)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(maximum) ^
      const DeepCollectionEquality().hash(minimum);

  @override
  _$DatesCopyWith<_Dates> get copyWith =>
      __$DatesCopyWithImpl<_Dates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DatesToJson(this);
  }
}

abstract class _Dates implements Dates {
  factory _Dates(
      {@JsonKey(name: 'maximum') String maximum,
      @JsonKey(name: 'minimum') String minimum}) = _$_Dates;

  factory _Dates.fromJson(Map<String, dynamic> json) = _$_Dates.fromJson;

  @override
  @JsonKey(name: 'maximum')
  String get maximum;
  @override
  @JsonKey(name: 'minimum')
  String get minimum;
  @override
  _$DatesCopyWith<_Dates> get copyWith;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return _Item.fromJson(json);
}

class _$ItemTearOff {
  const _$ItemTearOff();

  _Item call(
      {@JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'voteCount') int voteCount,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate}) {
    return _Item(
      popularity: popularity,
      voteCount: voteCount,
      video: video,
      posterPath: posterPath,
      id: id,
      adult: adult,
      backdropPath: backdropPath,
      originalLanguage: originalLanguage,
      originalTitle: originalTitle,
      genreIds: genreIds,
      title: title,
      voteAverage: voteAverage,
      overview: overview,
      releaseDate: releaseDate,
    );
  }
}

// ignore: unused_element
const $Item = _$ItemTearOff();

mixin _$Item {
  @JsonKey(name: 'popularity')
  double get popularity;
  @JsonKey(name: 'voteCount')
  int get voteCount;
  @JsonKey(name: 'video')
  bool get video;
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @JsonKey(name: 'id')
  int get id;
  @JsonKey(name: 'adult')
  bool get adult;
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @JsonKey(name: 'title')
  String get title;
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @JsonKey(name: 'overview')
  String get overview;
  @JsonKey(name: 'release_date')
  String get releaseDate;

  Map<String, dynamic> toJson();
  $ItemCopyWith<Item> get copyWith;
}

abstract class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) then) =
      _$ItemCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'voteCount') int voteCount,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate});
}

class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._value, this._then);

  final Item _value;
  // ignore: unused_field
  final $Res Function(Item) _then;

  @override
  $Res call({
    Object popularity = freezed,
    Object voteCount = freezed,
    Object video = freezed,
    Object posterPath = freezed,
    Object id = freezed,
    Object adult = freezed,
    Object backdropPath = freezed,
    Object originalLanguage = freezed,
    Object originalTitle = freezed,
    Object genreIds = freezed,
    Object title = freezed,
    Object voteAverage = freezed,
    Object overview = freezed,
    Object releaseDate = freezed,
  }) {
    return _then(_value.copyWith(
      popularity:
          popularity == freezed ? _value.popularity : popularity as double,
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int,
      video: video == freezed ? _value.video : video as bool,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      id: id == freezed ? _value.id : id as int,
      adult: adult == freezed ? _value.adult : adult as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String,
      genreIds: genreIds == freezed ? _value.genreIds : genreIds as List<int>,
      title: title == freezed ? _value.title : title as String,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double,
      overview: overview == freezed ? _value.overview : overview as String,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String,
    ));
  }
}

abstract class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) then) =
      __$ItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'voteCount') int voteCount,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate});
}

class __$ItemCopyWithImpl<$Res> extends _$ItemCopyWithImpl<$Res>
    implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(_Item _value, $Res Function(_Item) _then)
      : super(_value, (v) => _then(v as _Item));

  @override
  _Item get _value => super._value as _Item;

  @override
  $Res call({
    Object popularity = freezed,
    Object voteCount = freezed,
    Object video = freezed,
    Object posterPath = freezed,
    Object id = freezed,
    Object adult = freezed,
    Object backdropPath = freezed,
    Object originalLanguage = freezed,
    Object originalTitle = freezed,
    Object genreIds = freezed,
    Object title = freezed,
    Object voteAverage = freezed,
    Object overview = freezed,
    Object releaseDate = freezed,
  }) {
    return _then(_Item(
      popularity:
          popularity == freezed ? _value.popularity : popularity as double,
      voteCount: voteCount == freezed ? _value.voteCount : voteCount as int,
      video: video == freezed ? _value.video : video as bool,
      posterPath:
          posterPath == freezed ? _value.posterPath : posterPath as String,
      id: id == freezed ? _value.id : id as int,
      adult: adult == freezed ? _value.adult : adult as bool,
      backdropPath: backdropPath == freezed
          ? _value.backdropPath
          : backdropPath as String,
      originalLanguage: originalLanguage == freezed
          ? _value.originalLanguage
          : originalLanguage as String,
      originalTitle: originalTitle == freezed
          ? _value.originalTitle
          : originalTitle as String,
      genreIds: genreIds == freezed ? _value.genreIds : genreIds as List<int>,
      title: title == freezed ? _value.title : title as String,
      voteAverage:
          voteAverage == freezed ? _value.voteAverage : voteAverage as double,
      overview: overview == freezed ? _value.overview : overview as String,
      releaseDate:
          releaseDate == freezed ? _value.releaseDate : releaseDate as String,
    ));
  }
}

@JsonSerializable()
class _$_Item implements _Item {
  _$_Item(
      {@JsonKey(name: 'popularity') this.popularity,
      @JsonKey(name: 'voteCount') this.voteCount,
      @JsonKey(name: 'video') this.video,
      @JsonKey(name: 'poster_path') this.posterPath,
      @JsonKey(name: 'id') this.id,
      @JsonKey(name: 'adult') this.adult,
      @JsonKey(name: 'backdrop_path') this.backdropPath,
      @JsonKey(name: 'original_language') this.originalLanguage,
      @JsonKey(name: 'original_title') this.originalTitle,
      @JsonKey(name: 'genre_ids') this.genreIds,
      @JsonKey(name: 'title') this.title,
      @JsonKey(name: 'vote_average') this.voteAverage,
      @JsonKey(name: 'overview') this.overview,
      @JsonKey(name: 'release_date') this.releaseDate});

  factory _$_Item.fromJson(Map<String, dynamic> json) =>
      _$_$_ItemFromJson(json);

  @override
  @JsonKey(name: 'popularity')
  final double popularity;
  @override
  @JsonKey(name: 'voteCount')
  final int voteCount;
  @override
  @JsonKey(name: 'video')
  final bool video;
  @override
  @JsonKey(name: 'poster_path')
  final String posterPath;
  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'adult')
  final bool adult;
  @override
  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
  @override
  @JsonKey(name: 'original_language')
  final String originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  final String originalTitle;
  @override
  @JsonKey(name: 'genre_ids')
  final List<int> genreIds;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @override
  @JsonKey(name: 'overview')
  final String overview;
  @override
  @JsonKey(name: 'release_date')
  final String releaseDate;

  @override
  String toString() {
    return 'Item(popularity: $popularity, voteCount: $voteCount, video: $video, posterPath: $posterPath, id: $id, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, genreIds: $genreIds, title: $title, voteAverage: $voteAverage, overview: $overview, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Item &&
            (identical(other.popularity, popularity) ||
                const DeepCollectionEquality()
                    .equals(other.popularity, popularity)) &&
            (identical(other.voteCount, voteCount) ||
                const DeepCollectionEquality()
                    .equals(other.voteCount, voteCount)) &&
            (identical(other.video, video) ||
                const DeepCollectionEquality().equals(other.video, video)) &&
            (identical(other.posterPath, posterPath) ||
                const DeepCollectionEquality()
                    .equals(other.posterPath, posterPath)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.adult, adult) ||
                const DeepCollectionEquality().equals(other.adult, adult)) &&
            (identical(other.backdropPath, backdropPath) ||
                const DeepCollectionEquality()
                    .equals(other.backdropPath, backdropPath)) &&
            (identical(other.originalLanguage, originalLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.originalLanguage, originalLanguage)) &&
            (identical(other.originalTitle, originalTitle) ||
                const DeepCollectionEquality()
                    .equals(other.originalTitle, originalTitle)) &&
            (identical(other.genreIds, genreIds) ||
                const DeepCollectionEquality()
                    .equals(other.genreIds, genreIds)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.voteAverage, voteAverage) ||
                const DeepCollectionEquality()
                    .equals(other.voteAverage, voteAverage)) &&
            (identical(other.overview, overview) ||
                const DeepCollectionEquality()
                    .equals(other.overview, overview)) &&
            (identical(other.releaseDate, releaseDate) ||
                const DeepCollectionEquality()
                    .equals(other.releaseDate, releaseDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(popularity) ^
      const DeepCollectionEquality().hash(voteCount) ^
      const DeepCollectionEquality().hash(video) ^
      const DeepCollectionEquality().hash(posterPath) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(adult) ^
      const DeepCollectionEquality().hash(backdropPath) ^
      const DeepCollectionEquality().hash(originalLanguage) ^
      const DeepCollectionEquality().hash(originalTitle) ^
      const DeepCollectionEquality().hash(genreIds) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(voteAverage) ^
      const DeepCollectionEquality().hash(overview) ^
      const DeepCollectionEquality().hash(releaseDate);

  @override
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ItemToJson(this);
  }
}

abstract class _Item implements Item {
  factory _Item(
      {@JsonKey(name: 'popularity') double popularity,
      @JsonKey(name: 'voteCount') int voteCount,
      @JsonKey(name: 'video') bool video,
      @JsonKey(name: 'poster_path') String posterPath,
      @JsonKey(name: 'id') int id,
      @JsonKey(name: 'adult') bool adult,
      @JsonKey(name: 'backdrop_path') String backdropPath,
      @JsonKey(name: 'original_language') String originalLanguage,
      @JsonKey(name: 'original_title') String originalTitle,
      @JsonKey(name: 'genre_ids') List<int> genreIds,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'vote_average') double voteAverage,
      @JsonKey(name: 'overview') String overview,
      @JsonKey(name: 'release_date') String releaseDate}) = _$_Item;

  factory _Item.fromJson(Map<String, dynamic> json) = _$_Item.fromJson;

  @override
  @JsonKey(name: 'popularity')
  double get popularity;
  @override
  @JsonKey(name: 'voteCount')
  int get voteCount;
  @override
  @JsonKey(name: 'video')
  bool get video;
  @override
  @JsonKey(name: 'poster_path')
  String get posterPath;
  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'adult')
  bool get adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String get backdropPath;
  @override
  @JsonKey(name: 'original_language')
  String get originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String get originalTitle;
  @override
  @JsonKey(name: 'genre_ids')
  List<int> get genreIds;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'vote_average')
  double get voteAverage;
  @override
  @JsonKey(name: 'overview')
  String get overview;
  @override
  @JsonKey(name: 'release_date')
  String get releaseDate;
  @override
  _$ItemCopyWith<_Item> get copyWith;
}
