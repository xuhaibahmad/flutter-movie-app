import 'package:flutter_movie_app/models/api_responses/movie_details/movie_details_response.dart';

class MovieDetailsViewModel {
  final MovieDetailsResponse movie;

  MovieDetailsViewModel(this.movie);

  factory MovieDetailsViewModel.fromMovieDetailsResponse(
    MovieDetailsResponse movieDetailsResponse,
  ) {
    return MovieDetailsViewModel(movieDetailsResponse);
  }
}
