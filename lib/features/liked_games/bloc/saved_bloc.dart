import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/repos/detail_screen/abstract_detail_repo.dart';
import 'package:movie_app/features/liked_games/bloc/saved_event.dart';
import 'package:movie_app/features/liked_games/bloc/saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial()) {
    on<LoadSavedGames>((event, emit) async {
      if (state is! SavedLoaded) {
        emit(SavedLoading());
      }
      var list = await GetIt.I<AbstractDetailRepo>().getSavedGames();

      emit(SavedLoaded(list));
    });
  }
}
