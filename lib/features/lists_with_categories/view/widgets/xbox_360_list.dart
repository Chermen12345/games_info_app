import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_bloc.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_event.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_state.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/one_category_item.dart';

class Xbox360List extends StatefulWidget {
  Xbox360List({super.key});
  final _bloc = CategoryBloc();

  @override
  State<Xbox360List> createState() => _Xbox360ListState();
}

class _Xbox360ListState extends State<Xbox360List> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._bloc.add(LoadCategories(14));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text(
              "Xbox 360 games",
              style: GoogleFonts.roboto(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          bloc: widget._bloc,
          builder: (context, state) {
            if (state is CategoryStateLoaded) {
              return Padding(
                  padding: EdgeInsets.only(top: 20, left: 4, right: 4),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed("/details",
                                arguments: state.game_list[index]);
                          },
                          child: OneCategoryItem(
                            game: state.game_list[index],
                          ),
                        );
                      },
                      itemCount: state.game_list.length,
                      scrollDirection: Axis.horizontal,
                    ),
                  ));
            }
            if (state is CategoryStateFailure) {
              return const Center(
                child: Text("some errors, try again later"),
              );
            }
            return const SizedBox(
              width: double.infinity,
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
