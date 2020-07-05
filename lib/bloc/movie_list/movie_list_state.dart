part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

class MovieListInitialState extends MovieListState {}

class MovieListLoadingState extends MovieListState {}

class MovieListLoadedState extends MovieListState {
  final GenreListViewModel genreListViewModel;
  final MovieListViewModel movieListViewModel;

  MovieListLoadedState(
    this.genreListViewModel,
    this.movieListViewModel,
  );
}

class MovieListErrorState extends MovieListState {
  final MovieListError error;

  MovieListErrorState(this.error);
}
