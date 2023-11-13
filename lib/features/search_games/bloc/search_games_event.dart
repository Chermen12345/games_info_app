import 'package:equatable/equatable.dart';

abstract class SearchGamesEvent extends Equatable {}

class LoadSearchGames extends SearchGamesEvent {
  String query;
  LoadSearchGames(this.query);
  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
