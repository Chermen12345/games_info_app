import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/game.dart';

abstract class CategoryState extends Equatable {}

class CategoryStateInitial extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryStateLoading extends CategoryState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryStateLoaded extends CategoryState {
  List<Game> game_list;
  CategoryStateLoaded(this.game_list);
  @override
  // TODO: implement props
  List<Object?> get props => [game_list];
}

class CategoryStateFailure extends CategoryState {
  Object? fail;
  CategoryStateFailure(this.fail);
  @override
  // TODO: implement props
  List<Object?> get props => [fail];
}
