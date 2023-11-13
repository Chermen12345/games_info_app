import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/domain/models/game.dart';

class OneCategoryItem extends StatelessWidget {
  Game game;
  OneCategoryItem({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 150,
        height: 200,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Stack(fit: StackFit.expand, children: [
            CachedNetworkImage(
              imageUrl: game.background_image,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                game.name,
                style: TextStyle(color: Colors.white),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
