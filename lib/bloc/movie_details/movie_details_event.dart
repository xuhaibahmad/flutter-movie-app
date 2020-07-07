part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int movieId;

  GetMovieDetailsEvent(this.movieId);
}
