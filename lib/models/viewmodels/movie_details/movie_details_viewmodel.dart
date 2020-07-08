import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';

class MovieDetailsViewModel {
  final MovieDetailsResponse movie;
  final MovieListResponse similarMovies;

  MovieDetailsViewModel({this.movie, this.similarMovies});

  factory MovieDetailsViewModel.fromMovieDetailsResponse(
    MovieDetailsResponse movieDetailsResponse,
    MovieListResponse similarMoviesResponse,
  ) {
    return MovieDetailsViewModel(
      movie: movieDetailsResponse,
      similarMovies: similarMoviesResponse,
    );
  }
}
