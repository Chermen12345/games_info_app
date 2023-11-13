import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movie_app/features/home_list/view/screens/game_list_screen.dart';
import 'package:movie_app/features/liked_games/view/screens/liked_movies_screen.dart';
import 'package:movie_app/features/lists_with_categories/view/screens/category_movie_screen.dart';
import 'package:movie_app/features/search_games/view/screens/search_games_screen.dart';

class App extends StatefulWidget {
  App({super.key});
  int _selected_index = 0;
  List<Widget> page_list = [
    MovieListScreen(),
    CategoryMovieScreen(),
    SearchMoviesScreen(),
    LikedGamesScreen()
  ];

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).secondaryHeaderColor,
          title: const Row(
            children: [
              Text(
                "look for games here",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Icon(
                  Icons.gamepad,
                  color: Colors.white,
                ),
              )
            ],
          )),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: GNav(
            backgroundColor: Colors.black12,
            tabs: const [
              GButton(
                active: true,
                icon: Icons.home,
                text: "home",
              ),
              GButton(icon: Icons.category, text: "category"),
              GButton(icon: Icons.search, text: "search"),
              GButton(icon: Icons.favorite, text: "liked")
            ],
            color: Theme.of(context).secondaryHeaderColor,
            activeColor: Theme.of(context).secondaryHeaderColor,
            tabBorderRadius: 90,
            tabBackgroundColor: Theme.of(context).colorScheme.primary,
            hoverColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.all(16),
            tabMargin: const EdgeInsets.only(left: 10, right: 10),
            gap: 8,
            selectedIndex: widget._selected_index,
            onTabChange: (value) {
              setState(() {
                widget._selected_index = value;
              });
            },
          ),
        ),
      ),
      body: widget.page_list[widget._selected_index],
    );
  }
}
