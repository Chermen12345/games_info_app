import 'package:movie_app/domain/models/game.dart';

abstract class AbstractDetailRepo {
  void saveGame(Game game);
  void deleteGame(Game game);
  Future<List<Game>> getSavedGames();
  alreadySaved(Game game);
}
