part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState extends Equatable {}

@immutable
class MovieDetailsInitialState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

@immutable
class MovieDetailsLoadingState extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

@immutable
class MovieDetailsErrorState extends MovieDetailsState {
  final Error error;

  MovieDetailsErrorState(this.error);

  @override
  List<Object> get props => [error];
}

@immutable
class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetailsViewModel detailsViewModel;
  final MovieListViewModel similarViewModel;

  MovieDetailsLoadedState(this.detailsViewModel, this.similarViewModel);

  @override
  List<Object> get props => [detailsViewModel, similarViewModel];
}
