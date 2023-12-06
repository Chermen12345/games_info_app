import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_bloc.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_event.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_state.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/one_category_item.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/pc_list.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/ninswitch_list.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/xbox_360_list.dart';
import 'package:movie_app/features/lists_with_categories/view/widgets/xbox_one_list.dart';

class CategoryMovieScreen extends StatefulWidget {
  CategoryMovieScreen({super.key});

  @override
  State<CategoryMovieScreen> createState() => _CategoryMovieScreenState();
}

class _CategoryMovieScreenState extends State<CategoryMovieScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [XboxOneList(), Xbox360List(), PCList(), NinSwitchList()],
    ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
