import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

main() {
  MockMovieRepository mockMovieRepository;

  setUpAll(() {
    mockMovieRepository = MockMovieRepository();
  });

  group('MovieDetailsBloc', () {
    blocTest(
      'When nothing is added, then emit initial state',
      build: () async => MovieDetailsBloc(mockMovieRepository),
      skip: 0,
      expect: [isA<MovieDetailsInitialState>()],
    );

    blocTest(
      'When movie details request is successful, then emit movie details state',
      build: () async => MovieDetailsBloc(mockMovieRepository),
      act: (bloc) => bloc.add(GetMovieDetailsEvent(123)),
      expect: [
        isA<MovieDetailsLoadingState>(),
        isA<MovieDetailsLoadedState>(),
      ],
    );

    blocTest(
      'When movie details request is failed, then emit movie details error state',
      build: () async {
        when(await mockMovieRepository.getMovieDetails(any)).thenThrow(Error());
        return MovieDetailsBloc(mockMovieRepository);
      },
      act: (bloc) => bloc.add(GetMovieDetailsEvent(123)),
      expect: [
        isA<MovieDetailsLoadingState>(),
        isA<MovieDetailsErrorState>(),
      ],
    );
  });
}
