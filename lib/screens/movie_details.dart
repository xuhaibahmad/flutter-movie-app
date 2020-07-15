import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/movie_details/movie_details_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/movie_content_view.dart';
import 'package:flutter_movie_app/views/safe_image_view.dart';

class MovieDetailsScreen extends StatefulWidget implements AutoRouteWrapper {
  final Item movie;

  const MovieDetailsScreen({Key key, @required this.movie}) : super(key: key);

  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState(
        movie: movie,
        theme: getIt<AppTheme>(),
      );

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider(
        create: (context) => getIt<MovieDetailsBloc>(),
        child: this,
      );
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final AppTheme theme;
  final Item movie;
  MovieDetailsBloc bloc;

  _MovieDetailsScreenState({this.movie, this.theme});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc ??= BlocProvider.of<MovieDetailsBloc>(context)
      ..add(GetMovieDetailsEvent(movie.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: buildBackButton(context),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            buildBanner(),
            BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (_, state) {
                if (state is MovieDetailsLoadedState) {
                  return MovieContentView(
                    theme: theme,
                    movie: state.detailsViewModel.movie,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Padding buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipOval(
        child: Material(
          color: Colors.black26,
          child: InkWell(
            splashColor: Colors.white60,
            child: const SizedBox(
              width: 60,
              height: 60,
              child: const Icon(
                FlutterIcons.navigate_before_mdi,
                size: 24,
              ),
            ),
            onTap: () => ExtendedNavigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  Widget buildBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Container(
        height: 250,
        color: theme.textColor30,
        child: Hero(
          tag: movie,
          child: SafeImageView(
            path: movie.backdropPath,
            height: 250,
            width: null,
            icon: FlutterIcons.theater_masks_faw5s,
            iconSize: 100,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}
