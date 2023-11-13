import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/game.dart';

abstract class SavedState extends Equatable {}

class SavedInitial extends SavedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SavedLoading extends SavedState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SavedLoaded extends SavedState {
  List<Game> game_list;
  SavedLoaded(this.game_list);
  @override
  // TODO: implement props
  List<Object?> get props => [game_list];
}
