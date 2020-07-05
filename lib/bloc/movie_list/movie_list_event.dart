part of 'movie_list_bloc.dart';

@immutable
abstract class MovieListEvent {}

class GetNowPlayingMovieListEvent extends MovieListEvent {}

class GetTrendingMovieListEvent extends MovieListEvent {}

class GetUpcomingMovieListEvent extends MovieListEvent {}

class GetMovieListByGenreEvent extends MovieListEvent {
  final String genreId;

  GetMovieListByGenreEvent(this.genreId);
}
