import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';

class MovieListViewModel {
  final int pageCount;
  final int resultCount;
  final List<Item> results;

  const MovieListViewModel({
    this.pageCount,
    this.resultCount,
    this.results,
  });

  factory MovieListViewModel.fromMovieResponse(
    MovieListResponse response,
  ) {
    return MovieListViewModel(
      pageCount: response.totalPages,
      resultCount: response.totalResults,
      results: response.results,
    );
  }
}
