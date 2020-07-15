import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mocks.dart';

main() {
  MockAppRepository mockRepository;

  setUp(() {
    mockRepository = MockAppRepository();
  });

  group('AppBloc', () {
    blocTest(
      'When nothing is added, then emit initial state with default values',
      build: () async {
        when(mockRepository.nightModeEnabled).thenReturn(false);
        when(mockRepository.contentFilterEnabled).thenReturn(false);
        return AppBloc(mockRepository);
      },
      skip: 0,
      expect: [
        AppInitialState(
          nightModeEnabled: false,
          contentFilterEnabled: false,
        )
      ],
    );

    blocTest(
      'When preferences are requested, then emit preference state',
      build: () async {
        when(mockRepository.nightModeEnabled).thenReturn(true);
        when(mockRepository.contentFilterEnabled).thenReturn(false);
        return AppBloc(mockRepository);
      },
      act: (bloc) => bloc.add(GetPreferenceEvent()),
      expect: [
        PreferenceState(
          nightModeEnabled: true,
          contentFilterEnabled: false,
        )
      ],
    );

    blocTest(
      'When night mode config is update, then emit preference state',
      build: () async => AppBloc(mockRepository),
      act: (bloc) => bloc.add(UpdateNightModeEvent(false)),
      expect: [isA<PreferenceState>()],
    );

    blocTest(
      'When content filter config is update, then emit preference state',
      build: () async => AppBloc(mockRepository),
      act: (bloc) => bloc.add(UpdateContentFilterEvent(false)),
      expect: [isA<PreferenceState>()],
    );
  });
}
