import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home_list/bloc/game_list.bloc.dart';
import 'package:movie_app/features/liked_games/bloc/saved_bloc.dart';
import 'package:movie_app/features/liked_games/bloc/saved_event.dart';
import 'package:movie_app/features/liked_games/bloc/saved_state.dart';

import '../widgets/one_saved_item.dart';

class LikedGamesScreen extends StatefulWidget {
  LikedGamesScreen({super.key});
  late SavedBloc _bloc;
  @override
  State<LikedGamesScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<LikedGamesScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._bloc = SavedBloc();

    widget._bloc.add(LoadSavedGames());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        var completer = Completer();
        widget._bloc.add(LoadSavedGames());
        return completer.future;
      },
      child: BlocBuilder<SavedBloc, SavedState>(
        bloc: widget._bloc,
        builder: (context, state) {
          if (state is SavedLoaded) {
            return GridView.builder(
                shrinkWrap: true,
                itemCount: state.game_list.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 60 / 90),
                itemBuilder: ((context, index) {
                  return OneSavedItem(game: state.game_list[index]);
                }));
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
