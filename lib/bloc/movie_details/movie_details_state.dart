part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoadingState extends MovieDetailsState {}

class MovieDetailsErrorState extends MovieDetailsState {
  final MovieDetailsError error;

  MovieDetailsErrorState(this.error);
}

class MovieDetailsLoadedState extends MovieDetailsState {
  final MovieDetailsViewModel viewModel;

  MovieDetailsLoadedState(this.viewModel);
}
