import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/domain/models/game.dart';
import 'package:movie_app/domain/repos/detail_screen/abstract_detail_repo.dart';

class DetailRepo implements AbstractDetailRepo {
  Box<Game> saved_games;
  DetailRepo({required this.saved_games});
  @override
  void saveGame(Game game) {
    saved_games.put(game.name, game);
  }

  @override
  Future<List<Game>> getSavedGames() async {
    var list = saved_games.values.toList();
    return list;
  }

  @override
  bool alreadySaved(Game game) {
    if (saved_games.containsKey(game.name)) {
      return true;
    }
    return false;
  }

  @override
  void deleteGame(Game game) {
    saved_games.delete(game.name);
  }
}
