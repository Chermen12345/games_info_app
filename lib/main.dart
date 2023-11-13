import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie_app/app/app.dart';
import 'package:movie_app/domain/models/game.dart';
import 'package:movie_app/domain/repos/category_screen/abstract_category_repo.dart';
import 'package:movie_app/domain/repos/category_screen/category_repo.dart';
import 'package:movie_app/domain/repos/detail_screen/abstract_detail_repo.dart';
import 'package:movie_app/domain/repos/detail_screen/detail_repo.dart';
import 'package:movie_app/domain/repos/home_screen/abstract_home_list_repo.dart';
import 'package:movie_app/domain/repos/home_screen/home_list_repo.dart';
import 'package:movie_app/domain/repos/search_screen/abstract_search_repo.dart';
import 'package:movie_app/domain/repos/search_screen/search_repo.dart';

import 'package:movie_app/routes/my_routes.dart';
import 'package:movie_app/theme/customtheme.dart';

void main() async {
  GetIt.I.registerSingleton<AbstractHomeListRepo>(HomeListRepo());
  GetIt.I.registerSingleton<AbstractSearchRepo>(SearchRepo());
  GetIt.I.registerSingleton<AbstractCategoryRepo>(CategoryRepo());

  await Hive.initFlutter();
  Hive.registerAdapter(GameAdapter());
  Box<Game> games_box = await Hive.openBox('game_box');
  GetIt.I.registerSingleton<AbstractDetailRepo>(
      DetailRepo(saved_games: games_box));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: my_routes, title: 'Flutter Demo', theme: dark_theme);
  }
}
