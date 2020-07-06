import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/errors.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_movie_app/utils/mixins/auto_reset_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

@preResolve
@lazySingleton
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState>
    with AutoResetLazySingleton<MovieDetailsEvent, MovieDetailsState> {
  final MovieRepository repository;

  MovieDetailsBloc({this.repository}) : super(MovieDetailsInitial());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is GetMovieDetailsEvent) {
      yield MovieDetailsLoadingState();
      try {
        final response = await repository.getMovieDetails(event.movieId);
        final movie = MovieDetailsViewModel.fromMovieDetailsResponse(response);
        yield MovieDetailsLoadedState(movie);
      } on MovieDetailsError catch (e) {
        yield MovieDetailsErrorState(e);
      }
    }
  }
}
