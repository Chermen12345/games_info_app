import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:movie_app/domain/repos/home_screen/abstract_home_list_repo.dart';
import 'package:movie_app/features/home_list/bloc/game_list_event.dart';
import 'package:movie_app/features/home_list/bloc/game_list_state.dart';

class GameListBloc extends Bloc<GameListEvent, GameListState> {
  GameListBloc() : super(GameListInitial()) {
    on<LoadGameList>((event, emit) async {
      try {
        if (state is! GameListLoaded) {
          emit(GameListLoading());
        }
        final game_list = await GetIt.I<AbstractHomeListRepo>().getGamesList();
        emit(GameListLoaded(game_list));
      } catch (e) {
        emit(GameListFail(e));
      } finally {
        event.completer?.complete();
      }
    });
  }
}
