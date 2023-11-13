import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/repos/search_screen/abstract_search_repo.dart';
import 'package:movie_app/domain/repos/search_screen/search_repo.dart';
import 'package:movie_app/features/search_games/bloc/search_games_event.dart';
import 'package:movie_app/features/search_games/bloc/search_games_state.dart';

class SearchGamesBloc extends Bloc<SearchGamesEvent, SearchGamesState> {
  SearchGamesBloc() : super(SearchGamesInitial()) {
    on<LoadSearchGames>((event, emit) async {
      try {
        if (state is! SearchGamesLoaded) {
          emit(SearchGamesLoading());
        }
        final games_list =
            await GetIt.I<AbstractSearchRepo>().searchGames(event.query);
        emit(SearchGamesLoaded(games_list));
      } catch (e) {
        emit(SearchGamesFailed(e));
      }
    });
  }
}
