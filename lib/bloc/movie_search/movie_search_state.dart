part of 'movie_search_bloc.dart';

@immutable
abstract class MovieSearchState {}

class MovieSearchInitialState extends MovieSearchState {}

class MovieSearchLoadingState extends MovieSearchState {}

class MovieSearchErrorState extends MovieSearchState {
  final Error error;

  MovieSearchErrorState(this.error);
}

class MovieSearchLoadedState extends MovieSearchState {
  final MovieListViewModel viewModel;

  MovieSearchLoadedState(this.viewModel);
}
