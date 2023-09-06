part of 'item_bloc.dart';

@immutable
sealed class ItemEvent extends Equatable {
  const ItemEvent();
}

class GetItems extends ItemEvent {
  const GetItems();

  @override
  List<Object?> get props => [];
}

class DeleteItem extends ItemEvent {
  final int itemId;

  const DeleteItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class CreateItem extends ItemEvent {
  final dynamic item;

  const CreateItem(this.item);

  @override
  List<Object?> get props => [item];
}

class UpdateItem extends ItemEvent {
  final dynamic item;
  final int itemId;

  const UpdateItem(this.item, this.itemId);

  @override
  List<Object?> get props => [item];
}
