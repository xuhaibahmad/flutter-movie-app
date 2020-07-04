import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';

class MovieListScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieListScreen({Key key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<MovieListBloc>(),
        child: this,
      );
}

class _MovieListScreenState extends State<MovieListScreen> {
  MovieListBloc movieListBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieListBloc ??= BlocProvider.of<MovieListBloc>(context)
      ..add(GetMovieListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListLoadedState) {
              return buildMovieList(state);
            } else if (state is MovieListErrorState) {
              return buildError();
            } else {
              return buildLoading();
            }
          },
        ));
  }

  Widget buildLoading() => ProgressView();

  Widget buildError() => ErrorView();

  Widget buildMovieList(MovieListLoadedState state) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.viewModel.results.length,
        itemBuilder: (BuildContext context, int index) {
          final movieItem = state.viewModel.results[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movieItem.title),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    movieListBloc.close();
    super.dispose();
  }
}
