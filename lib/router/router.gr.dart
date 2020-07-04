// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_movie_app/screens/movie_list.dart';

abstract class Routes {
  static const movieListPage = '/';
  static const all = {
    movieListPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.movieListPage:
        if (hasInvalidArgs<MovieListScreenArguments>(args)) {
          return misTypedArgsRoute<MovieListScreenArguments>(args);
        }
        final typedArgs =
            args as MovieListScreenArguments ?? MovieListScreenArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              MovieListScreen(key: typedArgs.key).wrappedRoute(context),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//MovieListScreen arguments holder class
class MovieListScreenArguments {
  final Key key;
  MovieListScreenArguments({this.key});
}
