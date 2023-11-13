import 'package:movie_app/domain/models/game.dart';

abstract class AbstractCategoryRepo {
  Future<List<Game>> getGamesList(int platform_id);
}
