import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/viewmodels/genre_list/genre_list_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:flutter_svg/svg.dart';

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
      ..add(GetNowPlayingMovieListEvent());
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
            icon: SvgPicture.asset("assets/menu.svg"),
            iconSize: 24,
            onPressed: () {
              // TODO: Open drawer
              print("Hamburger Pressed!");
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/search.svg"),
              iconSize: 24,
              onPressed: () {
                // TODO: Open search field
                print("Search Pressed!");
              },
            ),
          ],
        ),
        body: BlocBuilder<MovieListBloc, MovieListState>(
          builder: (context, state) {
            if (state is MovieListLoadingState) {
              return buildLoading();
            } else if (state is MovieListErrorState) {
              return buildError();
            } else {
              return buildMovieList(state);
            }
          },
        ));
  }

  Widget buildLoading() => ProgressView();

  Widget buildError() => ErrorView();

  Widget buildMovieList(MovieListLoadedState state) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTabs(),
          buildCategories(state.genreListViewModel),
          buildList(state.movieListViewModel),
        ],
      ),
    );
  }

  Widget buildList(MovieListViewModel viewModel) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: viewModel.results.length,
          itemBuilder: (BuildContext context, int index) {
            final movieItem = viewModel.results[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(movieItem.title),
            );
          },
        ),
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 40,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            FlatButton(
              child: Text("In Theater"),
              onPressed: () => movieListBloc.add(GetNowPlayingMovieListEvent()),
            ),
            FlatButton(
              child: Text("Trending"),
              onPressed: () => movieListBloc.add(GetTrendingMovieListEvent()),
            ),
            FlatButton(
              child: Text("Coming Soon"),
              onPressed: () => movieListBloc.add(GetUpcomingMovieListEvent()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategories(GenreListViewModel viewModel) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: viewModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = viewModel.items[index];
          return Container(
            padding: EdgeInsets.all(8),
            child: ChoiceChip(
              label: Text(item.name),
              selected: viewModel.selectedId == item.id.toString(),
              onSelected: (selected) {
                movieListBloc.add(GetMovieListByGenreEvent("${item.id}"));
              },
            ),
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
