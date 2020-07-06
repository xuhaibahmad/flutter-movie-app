import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:flutter_svg/svg.dart';

class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  final String movieId;

  const MovieDetailsScreen({
    Key key,
    @required this.movieId,
  }) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState(movieId);

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<MovieDetailsBloc>(),
        child: this,
      );
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final String movieId;
  MovieDetailsBloc bloc;

  _MovieDetailsScreenState(this.movieId);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= BlocProvider.of<MovieDetailsBloc>(context)
      ..add(GetMovieDetailsEvent(movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        //extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: SvgPicture.asset("assets/back.svg"),
            iconSize: 24,
            onPressed: () => ExtendedNavigator.of(context).pop(),
          ),
        ),
        body: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (_, state) {
            if (state is MovieDetailsLoadedState) {
              return buildMovieDetails(state);
            } else if (state is MovieDetailsErrorState) {
              return buildError();
            } else {
              return buildLoading();
            }
          },
        ));
  }

  Widget buildLoading() => ProgressView();

  Widget buildError() => ErrorView();

  Widget buildMovieDetails(MovieDetailsLoadedState state) {
    final movie = state.viewModel.movie;
    return Container(
      child: Center(child: Text("Movie: ${movie.title}")),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
