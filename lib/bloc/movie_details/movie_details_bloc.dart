import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_app/data/movie_repository.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_details/movie_details_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
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

  MovieDetailsBloc(this.repository) : super(MovieDetailsInitialState());

  @override
  Stream<MovieDetailsState> mapEventToState(
    MovieDetailsEvent event,
  ) async* {
    if (event is GetMovieDetailsEvent) {
      yield MovieDetailsLoadingState();
      try {
        final details = await repository.getMovieDetails(event.movieId);
        final similar = await repository.getSimilarMovies(event.movieId);
        yield MovieDetailsLoadedState(details, similar);
      } on Error catch (e) {
        yield MovieDetailsErrorState(e);
      }
    }
  }
}
