import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_list/bloc/game_list.bloc.dart';
import 'package:movie_app/features/home_list/bloc/game_list_event.dart';
import 'package:movie_app/features/home_list/bloc/game_list_state.dart';
import 'package:movie_app/features/home_list/view/widgets/one_home_item.dart';

class MovieListScreen extends StatefulWidget {
  MovieListScreen({super.key});
  late GameListBloc _bloc;
  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._bloc = GameListBloc();

    widget._bloc.add(LoadGameList(null));
  }

  bool isWebOrDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    if (isWebOrDesktop(context)) {
      return RefreshIndicator(
        onRefresh: () async {
          var completer = Completer();
          widget._bloc.add(LoadGameList(completer));
          return completer.future;
        },
        child: BlocBuilder<GameListBloc, GameListState>(
          bloc: widget._bloc,
          builder: (context, state) {
            if (state is GameListLoaded) {
              return GridView.builder(
                  shrinkWrap: true,
                  itemCount: state.gameList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: ((context, index) {
                    return OneHomeItem(game: state.gameList[index]);
                  }));
            }
            if (state is GameListFail) {
              return Center(
                child: Text(
                  "${state.failure}",
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      );
    }
    return RefreshIndicator(
      onRefresh: () async {
        var completer = Completer();
        widget._bloc.add(LoadGameList(completer));
        return completer.future;
      },
      child: BlocBuilder<GameListBloc, GameListState>(
        bloc: widget._bloc,
        builder: (context, state) {
          if (state is GameListLoaded) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: state.gameList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 60 / 90),
                itemBuilder: ((context, index) {
                  return OneHomeItem(game: state.gameList[index]);
                }));
          }
          if (state is GameListFail) {
            return Center(
              child: Text(
                "${state.failure}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
