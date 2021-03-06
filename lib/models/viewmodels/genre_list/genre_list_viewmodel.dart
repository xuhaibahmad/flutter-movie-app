import 'package:flutter_movie_app/models/api_responses/genre_list/genre_list_response.dart';

const ALLOWED_GENRES = [];

class GenreListViewModel {
  final int selectedId;
  final List<Genre> items;

  GenreListViewModel({
    this.selectedId,
    this.items,
  });

  factory GenreListViewModel.fromGenreResponse(
    int selectedId,
    GenreListResponse response,
  ) {
    return GenreListViewModel(
      selectedId: selectedId,
      items: response.genres,
    );
  }
}
