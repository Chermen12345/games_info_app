import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/search_games/bloc/search_games_bloc.dart';
import 'package:movie_app/features/search_games/bloc/search_games_event.dart';
import 'package:movie_app/features/search_games/bloc/search_games_state.dart';
import 'package:movie_app/features/search_games/view/widgets/one_search_item.dart';

class SearchMoviesScreen extends StatefulWidget {
  SearchMoviesScreen({super.key});

  TextEditingController search_controller = TextEditingController();
  SearchGamesBloc _bloc = SearchGamesBloc();

  @override
  State<SearchMoviesScreen> createState() => _SearchMoviesScreenState();
}

class _SearchMoviesScreenState extends State<SearchMoviesScreen> {
  bool isWebOrDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isWebOrDesktop(context)
          ? Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 10, top: 20, bottom: 20),
                        height: 45,
                        width: 500,
                        child: TextField(
                          controller: widget.search_controller,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "search the game",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: IconButton(
                        onPressed: () {
                          if (widget.search_controller.text.isNotEmpty) {
                            widget._bloc.add(
                                LoadSearchGames(widget.search_controller.text));
                          }
                        },
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: BlocBuilder<SearchGamesBloc, SearchGamesState>(
                        bloc: widget._bloc,
                        builder: (context, state) {
                          if (state is SearchGamesLoaded) {
                            return GridView.builder(
                                itemCount: state.game_list.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: ((context, index) {
                                  return OneSearchItem(
                                      game: state.game_list[index]);
                                }));
                          }
                          if (state is SearchGamesFailed) {
                            return Center(
                              child: Text(
                                "${state.failure}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          return SizedBox();
                        }))
              ],
            )
          : Column(
              children: [
                Row(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 10, top: 20, bottom: 20),
                        height: 45,
                        width: 300,
                        child: TextField(
                          controller: widget.search_controller,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "search the game",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                        )),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5, left: 10, right: 10),
                      child: IconButton(
                        onPressed: () {
                          if (widget.search_controller.text.isNotEmpty) {
                            widget._bloc.add(
                                LoadSearchGames(widget.search_controller.text));
                          }
                        },
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Expanded(
                    child: BlocBuilder<SearchGamesBloc, SearchGamesState>(
                        bloc: widget._bloc,
                        builder: (context, state) {
                          if (state is SearchGamesLoaded) {
                            return GridView.builder(
                                itemCount: state.game_list.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: ((context, index) {
                                  return OneSearchItem(
                                      game: state.game_list[index]);
                                }));
                          }
                          if (state is SearchGamesFailed) {
                            return Center(
                              child: Text(
                                "${state.failure}",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                          return SizedBox();
                        }))
              ],
            ),
    );
  }
}
