import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/models/game.dart';

abstract class SearchGamesState extends Equatable {}

class SearchGamesInitial extends SearchGamesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchGamesLoading extends SearchGamesState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SearchGamesLoaded extends SearchGamesState {
  List<Game> game_list;
  SearchGamesLoaded(this.game_list);
  @override
  // TODO: implement props
  List<Object?> get props => [game_list];
}

class SearchGamesFailed extends SearchGamesState {
  Object? failure;
  SearchGamesFailed(this.failure);
  @override
  // TODO: implement props
  List<Object?> get props => [failure];
}
