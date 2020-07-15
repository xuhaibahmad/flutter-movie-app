part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListState extends Equatable {}

@immutable
class MovieListInitialState extends MovieListState {
  @override
  List<Object> get props => [];
}

@immutable
class MovieListLoadingState extends MovieListState {
  @override
  List<Object> get props => [];
}

@immutable
class MovieListLoadedState extends MovieListState {
  final GenreListViewModel genreListViewModel;
  final MovieListViewModel movieListViewModel;

  MovieListLoadedState(
    this.genreListViewModel,
    this.movieListViewModel,
  );

  @override
  List<Object> get props => [genreListViewModel, movieListViewModel];
}

@immutable
class MovieListErrorState extends MovieListState {
  final Error error;

  MovieListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
