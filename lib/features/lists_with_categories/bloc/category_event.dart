import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {}

class LoadCategories extends CategoryEvent {
  int id;
  LoadCategories(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
