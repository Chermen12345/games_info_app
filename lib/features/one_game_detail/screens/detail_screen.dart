import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/domain/models/game.dart';
import 'package:movie_app/domain/repos/detail_screen/abstract_detail_repo.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool isAlreadySaved = GetIt.I<AbstractDetailRepo>().alreadySaved(game);
  late Game game;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null) {
      debugPrint("you must provide args");
    }
    if (args is! Game) {
      return;
    }
    game = args;
  }

  bool isWebOrDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                "rating: ${game.rating}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            ],
          )),
      body: isWebOrDesktop(context)
          ? SingleChildScrollView(
              child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: game.background_image,
                      width: double.infinity,
                      height: 550,
                    ),
                    IconButton(
                      onPressed: () {
                        if (isAlreadySaved) {
                          setState(() {
                            GetIt.I<AbstractDetailRepo>().deleteGame(game);
                            isAlreadySaved = false;
                          });
                        } else {
                          setState(() {
                            GetIt.I<AbstractDetailRepo>().saveGame(game);
                            isAlreadySaved = true;
                          });
                        }
                      },
                      icon: const Icon(Icons.favorite),
                      color: isAlreadySaved ? Colors.red : Colors.white,
                      iconSize: 35.0,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: Text(
                        game.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: Text(
                        game.released,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ))
          : SingleChildScrollView(
              child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: game.background_image,
                      width: double.infinity,
                      height: 450,
                    ),
                    IconButton(
                      onPressed: () {
                        if (isAlreadySaved) {
                          setState(() {
                            GetIt.I<AbstractDetailRepo>().deleteGame(game);
                            isAlreadySaved = false;
                          });
                        } else {
                          setState(() {
                            GetIt.I<AbstractDetailRepo>().saveGame(game);
                            isAlreadySaved = true;
                          });
                        }
                      },
                      icon: const Icon(Icons.favorite),
                      color: isAlreadySaved ? Colors.red : Colors.white,
                      iconSize: 35.0,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: Text(
                        game.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Card(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 10),
                      child: Text(
                        game.released,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
