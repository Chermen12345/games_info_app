import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/game.dart';

class OneSavedItem extends StatelessWidget {
  Game game;
  OneSavedItem({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/details", arguments: game);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            color: const Color.fromARGB(255, 65, 65, 65),
            height: 100,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: game.background_image,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    game.name,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
