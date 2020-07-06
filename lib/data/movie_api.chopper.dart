// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MovieApi extends MovieApi {
  _$MovieApi([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MovieApi;

  @override
  Future<Response<MovieListResponse>> getNowPlaying() {
    final $url = 'https://api.themoviedb.org/3/movie/now_playing';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }

  @override
  Future<Response<MovieListResponse>> getUpcoming() {
    final $url = 'https://api.themoviedb.org/3/movie/upcoming';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }

  @override
  Future<Response<MovieListResponse>> getPopular() {
    final $url = 'https://api.themoviedb.org/3/movie/popular';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }

  @override
  Future<Response<MovieDetailsResponse>> getMovie(String movieId) {
    final $url = 'https://api.themoviedb.org/3/movie/$movieId';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MovieDetailsResponse, MovieDetailsResponse>($request);
  }

  @override
  Future<Response<MovieListResponse>> search(String query) {
    final $url = 'https://api.themoviedb.org/3/search/movie';
    final $params = <String, dynamic>{'query': query};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }

  @override
  Future<Response<MovieListResponse>> getByGenre(String genreId) {
    final $url = 'https://api.themoviedb.org/3/discover/movie';
    final $params = <String, dynamic>{'with_genres': genreId};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<MovieListResponse, MovieListResponse>($request);
  }

  @override
  Future<Response<GenreListResponse>> getGenres() {
    final $url = 'https://api.themoviedb.org/3/genre/movie/list';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<GenreListResponse, GenreListResponse>($request);
  }
}
