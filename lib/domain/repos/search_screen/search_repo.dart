import 'package:dio/dio.dart';
import 'package:movie_app/domain/models/game.dart';
import 'package:movie_app/domain/repos/search_screen/abstract_search_repo.dart';
import 'package:movie_app/core/consts/consts.dart';

class SearchRepo implements AbstractSearchRepo {
  @override
  Future<List<Game>> searchGames(String query) async {
    List<Game> game_list = [];
    final response = await Dio()
        .get("${BASE_URL}${HOME_END_POINT}?key=${API_KEY}&search=${query}");
    final data = response.data;
    final main_map = data['results'];
    for (var eachItem in main_map) {
      var game = Game.fromJson(eachItem);
      game_list.add(game);
    }
    return game_list;
  }
}
