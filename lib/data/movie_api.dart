import 'package:chopper/chopper.dart';
import 'package:flutter_movie_app/models/api_responses/genre_list/genre_list_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/utils/api_key_interceptor.dart';
import 'package:flutter_movie_app/utils/chopper_json_converter.dart';
import 'package:flutter_movie_app/utils/environment_info.dart';
import 'package:injectable/injectable.dart';

part "movie_api.chopper.dart";

const BASE_URL = 'https://api.themoviedb.org/3';
const IMAGE_BASE_URL = "https://image.tmdb.org/t/p/original";
const API_KEY = 'TMDB_API_KEY';

@singleton
@preResolve
@ChopperApi(baseUrl: BASE_URL)
abstract class MovieApi extends ChopperService {
  @Get(path: "/movie/now_playing")
  Future<Response<MovieListResponse>> getNowPlaying();

  @Get(path: "/movie/upcoming")
  Future<Response<MovieListResponse>> getUpcoming();

  @Get(path: "/movie/popular")
  Future<Response<MovieListResponse>> getPopular();

  @Get(path: "/movie/{movie_id}")
  Future<Response<MovieDetailsResponse>> getMovie(
    @Path("movie_id") int movieId,
  );

  @Get(path: "/search/movie")
  Future<Response<MovieListResponse>> search(
    @Query("query") String query,
  );

  @Get(path: "/discover/movie")
  Future<Response<MovieListResponse>> getByGenre(
    @Query("with_genres") String genreId,
  );

  @Get(path: "/genre/movie/list")
  Future<Response<GenreListResponse>> getGenres();

  @factoryMethod
  static Future<MovieApi> create(EnvironmentInfoProvider env) async {
    final apiKey = env.getEnvVariable(API_KEY);
    final client = ChopperClient(
      services: [_$MovieApi()],
      converter: JsonToTypeConverter({
        MovieListResponse: (json) => MovieListResponse.fromJson(json),
        MovieDetailsResponse: (json) => MovieDetailsResponse.fromJson(json),
        GenreListResponse: (json) => GenreListResponse.fromJson(json),
      }),
      interceptors: [
        ApiKeyInterceptor(apiKey: apiKey),
        HttpLoggingInterceptor(),
      ],
    );

    return _$MovieApi(client);
  }
}
