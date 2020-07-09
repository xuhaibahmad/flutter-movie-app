import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_app/utils/extensions/context_ext.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:logging/logging.dart';
import 'di/injection.dart';
import 'package:flutter/foundation.dart' as Foundation;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  setupLogging();
  // More of hack to make sure there is enough time for the
  // dependencies to initialze before being used
  await new Future.delayed(Duration(milliseconds: 200));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (_) => getIt<AppBloc>()),
        BlocProvider<MovieSearchBloc>(create: (_) => getIt<MovieSearchBloc>()),
      ],
      child: FlutterMoviesApp(theme: getIt<AppTheme>()),
    ),
  );
}

setupLogging() {
  if (!Foundation.kReleaseMode) {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((rec) {
      print('[API] ${rec.level.name}: ${rec.time}: ${rec.message}');
    });
  }
}

class FlutterMoviesApp extends StatelessWidget {
  final AppTheme theme;
  final navigatorKey = GlobalKey<ExtendedNavigatorState>();

  FlutterMoviesApp({Key key, @required this.theme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      bloc: BlocProvider.of<AppBloc>(context),
      builder: (context, state) {
        theme.darkMode = state.nightModeEnabled;
        context.applySystemColors(theme.darkMode);
        return MaterialApp(
          themeMode: theme.themeMode,
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          debugShowCheckedModeBanner: false,
          home: ExtendedNavigator<Router>(
            router: Router(),
            key: navigatorKey,
          ),
          initialRoute: Routes.movieListPage,
        );
      },
    );
  }
}
