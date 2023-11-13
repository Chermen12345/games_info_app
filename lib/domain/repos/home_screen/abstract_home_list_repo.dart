import 'package:movie_app/domain/models/game.dart';

abstract class AbstractHomeListRepo {
  Future<List<Game>> getGamesList();
}
