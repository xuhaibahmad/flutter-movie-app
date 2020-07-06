import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_app/bloc/app/app_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
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
  applySystemColors();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(create: (_) => getIt<AppBloc>()),
        BlocProvider<MovieSearchBloc>(create: (_) => getIt<MovieSearchBloc>()),
      ],
      child: FlutterMoviesApp(),
    ),
  );
}

applySystemColors() {
  final theme = SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white12,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
  SystemChrome.setSystemUIOverlayStyle(theme);
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
  final navigatorKey = GlobalKey<ExtendedNavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<AppBloc, AppState>(
        bloc: BlocProvider.of<AppBloc>(context),
        builder: (context, state) {
          return ExtendedNavigator<Router>(
            router: Router(),
            key: navigatorKey,
          );
        },
      ),
      initialRoute: Routes.movieListPage,
    );
  }
}
