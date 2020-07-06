import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_list/movie_list_bloc.dart';
import 'package:flutter_movie_app/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_movie_app/di/injection.dart';
import 'package:flutter_movie_app/models/viewmodels/genre_list/genre_list_viewmodel.dart';
import 'package:flutter_movie_app/models/viewmodels/movie_list/movie_list_viewmodel.dart';
import 'package:flutter_movie_app/router/router.gr.dart';
import 'package:flutter_movie_app/screens/settings.dart';
import 'package:flutter_movie_app/utils/hex_color_ext.dart';
import 'package:flutter_movie_app/views/delegates/movie_search_delegate.dart';
import 'package:flutter_movie_app/views/error_view.dart';
import 'package:flutter_movie_app/views/progress_view.dart';
import 'package:flutter_svg/svg.dart';

const TABS = [
  "In Theater",
  "Trending",
  "Coming Soon",
];

class MovieListScreen extends StatefulWidget implements AutoRouteWrapper {
  const MovieListScreen({Key key}) : super(key: key);

  @override
  _MovieListScreenState createState() => _MovieListScreenState();

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider<MovieListBloc>(
        create: (_) => getIt<MovieListBloc>(),
        child: this,
      );
}

class _MovieListScreenState extends State<MovieListScreen> {
  MovieListBloc movieBloc;
  MovieSearchBloc searchBloc;

  int _selectedTabIndex = 0;
  int _selectedCategoryIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    searchBloc ??= BlocProvider.of<MovieSearchBloc>(context);
    movieBloc ??= BlocProvider.of<MovieListBloc>(context)
      ..add(GetNowPlayingMovieListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/menu.svg"),
          iconSize: 24,
          onPressed: () => SettingsSheet.show(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/search.svg"),
            iconSize: 24,
            onPressed: () => showSearch(
              context: context,
              delegate: MovieSearchDelegate(searchBloc),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieListBloc, MovieListState>(
        builder: (_, state) {
          if (state is MovieListLoadedState) {
            return buildMovieList(state);
          } else if (state is MovieListErrorState) {
            return buildError();
          } else {
            return buildLoading();
          }
        },
      ),
    );
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
            return InkWell(
              onTap: () => openDetails("${movieItem.id}"),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(movieItem.title),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildTabs() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        shrinkWrap: true,
        itemCount: TABS.length,
        itemBuilder: (BuildContext context, int index) {
          final item = TABS[index];
          final selected = _selectedTabIndex == index;
          return buildTabListItem(item, selected, index);
        },
      ),
    );
  }

  Widget buildTabListItem(String item, bool selected, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          child: Text(
            item,
            style: TextStyle(
              fontFamily: "Proxima Nova",
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: HexColor.fromHex("12153D").withOpacity(selected ? 1 : 0.3),
            ),
          ),
          onPressed: () => onTabSelected(index),
        ),
        Visibility(
          visible: selected,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: SizedBox(
              height: 4,
              width: 28,
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor.fromHex("FE6D8E"),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ],
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
          final selected = _selectedCategoryIndex == index;
          return Container(
            padding: EdgeInsets.all(8),
            child: ChoiceChip(
              backgroundColor: Colors.transparent,
              selectedColor: HexColor.fromHex("FE6D8E"),
              label: Text(
                item.name,
                style: TextStyle(
                  fontFamily: "Proxima Nova",
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: selected ? Colors.white : HexColor.fromHex("434670"),
                ),
              ),
              shape: StadiumBorder(
                side: BorderSide(
                  color: selected
                      ? Colors.white
                      : HexColor.fromHex("12153D").withOpacity(.15),
                  width: .8,
                ),
              ),
              selected: viewModel.selectedId == item.id.toString(),
              onSelected: (_) {
                _selectedCategoryIndex = index;
                _selectedTabIndex = null;
                movieBloc.add(GetMovieListByGenreEvent("${item.id}"));
              },
            ),
          );
        },
      ),
    );
  }

  openDetails(String movieId) {
    ExtendedNavigator.of(context).pushNamed(
      Routes.movieDetailsPage,
      arguments: MovieDetailsScreenArguments(movieId: movieId),
    );
  }

  onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
      _selectedCategoryIndex = null;
      if (_selectedTabIndex == 0) {
        movieBloc.add(GetNowPlayingMovieListEvent());
      } else if (_selectedTabIndex == 1) {
        movieBloc.add(GetTrendingMovieListEvent());
      } else {
        movieBloc.add(GetUpcomingMovieListEvent());
      }
    });
  }

  @override
  void dispose() {
    movieBloc.close();
    searchBloc.close();
    super.dispose();
  }
}
