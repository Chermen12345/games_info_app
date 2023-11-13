import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class GameListEvent extends Equatable {}

class LoadGameList extends GameListEvent {
  Completer? completer;
  LoadGameList(this.completer);

  @override
  // TODO: implement props
  List<Object?> get props => [completer];
}
