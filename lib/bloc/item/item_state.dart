part of 'item_bloc.dart';

@immutable
sealed class ItemState extends Equatable {
  const ItemState();
}

class LoadingItem extends ItemState {
  @override
  List<Object> get props => [];
}

class LoadedItem extends ItemState {
  final List<dynamic> items;

  const LoadedItem(this.items);

  @override
  List<Object> get props => [items];
}

class CreatedItem extends ItemState {
  final dynamic message;

  const CreatedItem(this.message);

  @override
  List<Object> get props => [message];
}

class UpdatedItem extends ItemState {
  final dynamic message;

  const UpdatedItem(this.message);

  @override
  List<Object> get props => [message];
}

class DeletingItem extends ItemState {
  const DeletingItem();

  @override
  List<Object> get props => [];
}

class DeletedItem extends ItemState {
  final dynamic message;

  const DeletedItem(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorItem extends ItemState {
  final String error;

  const ErrorItem(this.error);

  @override
  List<Object> get props => [error];
}
