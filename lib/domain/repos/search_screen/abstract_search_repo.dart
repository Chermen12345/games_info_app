import 'package:movie_app/domain/models/game.dart';

abstract class AbstractSearchRepo {
  Future<List<Game>> searchGames(String query);
}
