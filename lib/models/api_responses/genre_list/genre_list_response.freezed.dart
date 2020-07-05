// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'genre_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
GenreListResponse _$GenreListResponseFromJson(Map<String, dynamic> json) {
  return _GenreListResponse.fromJson(json);
}

class _$GenreListResponseTearOff {
  const _$GenreListResponseTearOff();

  _GenreListResponse call({List<Genre> genres}) {
    return _GenreListResponse(
      genres: genres,
    );
  }
}

// ignore: unused_element
const $GenreListResponse = _$GenreListResponseTearOff();

mixin _$GenreListResponse {
  List<Genre> get genres;

  Map<String, dynamic> toJson();
  $GenreListResponseCopyWith<GenreListResponse> get copyWith;
}

abstract class $GenreListResponseCopyWith<$Res> {
  factory $GenreListResponseCopyWith(
          GenreListResponse value, $Res Function(GenreListResponse) then) =
      _$GenreListResponseCopyWithImpl<$Res>;
  $Res call({List<Genre> genres});
}

class _$GenreListResponseCopyWithImpl<$Res>
    implements $GenreListResponseCopyWith<$Res> {
  _$GenreListResponseCopyWithImpl(this._value, this._then);

  final GenreListResponse _value;
  // ignore: unused_field
  final $Res Function(GenreListResponse) _then;

  @override
  $Res call({
    Object genres = freezed,
  }) {
    return _then(_value.copyWith(
      genres: genres == freezed ? _value.genres : genres as List<Genre>,
    ));
  }
}

abstract class _$GenreListResponseCopyWith<$Res>
    implements $GenreListResponseCopyWith<$Res> {
  factory _$GenreListResponseCopyWith(
          _GenreListResponse value, $Res Function(_GenreListResponse) then) =
      __$GenreListResponseCopyWithImpl<$Res>;
  @override
  $Res call({List<Genre> genres});
}

class __$GenreListResponseCopyWithImpl<$Res>
    extends _$GenreListResponseCopyWithImpl<$Res>
    implements _$GenreListResponseCopyWith<$Res> {
  __$GenreListResponseCopyWithImpl(
      _GenreListResponse _value, $Res Function(_GenreListResponse) _then)
      : super(_value, (v) => _then(v as _GenreListResponse));

  @override
  _GenreListResponse get _value => super._value as _GenreListResponse;

  @override
  $Res call({
    Object genres = freezed,
  }) {
    return _then(_GenreListResponse(
      genres: genres == freezed ? _value.genres : genres as List<Genre>,
    ));
  }
}

@JsonSerializable()
class _$_GenreListResponse implements _GenreListResponse {
  _$_GenreListResponse({this.genres});

  factory _$_GenreListResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_GenreListResponseFromJson(json);

  @override
  final List<Genre> genres;

  @override
  String toString() {
    return 'GenreListResponse(genres: $genres)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _GenreListResponse &&
            (identical(other.genres, genres) ||
                const DeepCollectionEquality().equals(other.genres, genres)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(genres);

  @override
  _$GenreListResponseCopyWith<_GenreListResponse> get copyWith =>
      __$GenreListResponseCopyWithImpl<_GenreListResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_GenreListResponseToJson(this);
  }
}

abstract class _GenreListResponse implements GenreListResponse {
  factory _GenreListResponse({List<Genre> genres}) = _$_GenreListResponse;

  factory _GenreListResponse.fromJson(Map<String, dynamic> json) =
      _$_GenreListResponse.fromJson;

  @override
  List<Genre> get genres;
  @override
  _$GenreListResponseCopyWith<_GenreListResponse> get copyWith;
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
