import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/domain/repos/category_screen/abstract_category_repo.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_event.dart';
import 'package:movie_app/features/lists_with_categories/bloc/category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryStateInitial()) {
    on<LoadCategories>((event, emit) async {
      try {
        if (state is! CategoryStateLoaded) {
          emit(CategoryStateLoading());
        }
        final list =
            await GetIt.I<AbstractCategoryRepo>().getGamesList(event.id);
        emit(CategoryStateLoaded(list));
      } catch (e) {
        emit(CategoryStateFailure(e));
      }
    });
  }
}
