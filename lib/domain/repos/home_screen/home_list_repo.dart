import 'package:dio/dio.dart';
import 'package:movie_app/domain/models/game.dart';

import 'package:movie_app/domain/repos/home_screen/abstract_home_list_repo.dart';

import 'package:movie_app/core/consts/consts.dart';

class HomeListRepo implements AbstractHomeListRepo {
  @override
  Future<List<Game>> getGamesList() async {
    List<Game> game_list = [];
    final response =
        await Dio().get("${BASE_URL}${HOME_END_POINT}?key=${API_KEY}");

    final data = response.data;
    final node = data['results'];

    for (var each_game in node) {
      final one_game = Game.fromJson(each_game);
      game_list.add(one_game);
    }
    return game_list;
  }
}
