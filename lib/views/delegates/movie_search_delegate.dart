import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
import 'package:flutter_movie_app/styling.dart';
import 'package:flutter_movie_app/views/movie_poster_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:injectable/injectable.dart';

@singleton
class MovieSearchDelegate extends SearchDelegate {
  final AppTheme theme;
  final MovieSearchBloc bloc;

  MovieSearchDelegate(this.theme, this.bloc);

  @override
  ThemeData appBarTheme(BuildContext context) => theme.appBarTheme;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildError("Search term must be longer than two letters.")],
      );
    }

    bloc.add(SearchMoviesEvent(query));

    return Column(children: <Widget>[
      BlocBuilder<MovieSearchBloc, MovieSearchState>(
        builder: (context, state) {
          if (state is MovieSearchLoadingState) {
            return buildProgress();
          } else if (state is MovieSearchLoadedState) {
            if (state.viewModel.results.isEmpty) {
              return buildError("No Results Found.");
            } else {
              return buildSearchResults(state.viewModel);
            }
          } else {
            return buildError("Error occurred while fetching results.");
          }
        },
      ),
    ]);
  }

  Widget buildProgress() {
    return Center(child: ProgressView(darkMode: theme.darkMode));
  }

  Widget buildError(String message) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildSearchResults(MovieListViewModel viewModel) {
    final results = viewModel.results;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return buildSearchListItem(context, results[index]);
          },
        ),
      ),
    );
  }

  Widget buildSearchListItem(BuildContext context, Item result) {
    return InkWell(
      onTap: () => openDetails(context, result),
      child: Container(
        padding: EdgeInsets.all(4),
        child: ListTile(
          title: Text(result.title),
          leading: Container(
            width: 40,
            height: 60,
            child: MoviePosterView(
              iconSize: 28,
              posterPath: result.posterPath,
              icon: FlutterIcons.theater_masks_faw5s,
            ),
          ),
        ),
      ),
    );
  }

  openDetails(BuildContext context, Item movie) {
    ExtendedNavigator.of(context).pushNamed(
      Routes.movieDetailsPage,
      arguments: MovieDetailsScreenArguments(movie: movie),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
