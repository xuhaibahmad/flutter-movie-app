import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/data/movie_api.dart';
import 'package:flutter_movie_app/models/api_responses/movie_list/movie_list_response.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:injectable/injectable.dart';

@singleton
class MovieSearchDelegate extends SearchDelegate {
  final MovieSearchBloc bloc;

  MovieSearchDelegate(this.bloc);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }

    bloc.add(SearchMoviesEvent(query));

    return Column(
      children: <Widget>[
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
      ],
    );
  }

  Widget buildProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(child: CircularProgressIndicator()),
      ],
    );
  }

  Widget buildError(String message) {
    return Column(
      children: <Widget>[
        Text(message),
      ],
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
            var result = results[index];
            return buildSearchListItem(result);
          },
        ),
      ),
    );
  }

  Widget buildSearchListItem(Item result) {
    return Container(
      padding: EdgeInsets.all(4),
      child: ListTile(
        title: Text(result.title),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image(
            width: 40,
            height: 60,
            fit: BoxFit.fill,
            image: NetworkImage("$IMAGE_BASE_URL${result.posterPath}"),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
