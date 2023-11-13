import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/game.dart';

abstract class GameListState extends Equatable {}

class GameListInitial extends GameListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GameListLoading extends GameListState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GameListLoaded extends GameListState {
  List<Game> gameList;
  GameListLoaded(this.gameList);

  @override
  // TODO: implement props
  List<Object?> get props => [gameList];
}

class GameListFail extends GameListState {
  Object? failure;
  GameListFail(this.failure);

  @override
  // TODO: implement props
  List<Object?> get props => [failure];
}
