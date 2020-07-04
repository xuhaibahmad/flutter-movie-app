part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState {}

class MovieListInitialState extends MovieListState {}

class MovieListLoadingState extends MovieListState {}

class MovieListLoadedState extends MovieListState {
  final MovieListViewModel viewModel;

  MovieListLoadedState(this.viewModel);
}

class MovieListErrorState extends MovieListState {
  final MovieListError error;

  MovieListErrorState(this.error);
}
