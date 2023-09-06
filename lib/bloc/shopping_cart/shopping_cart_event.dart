part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
}

class GetShoppingCartContent extends ShoppingCartEvent {

  const GetShoppingCartContent();

  @override
  List<Object?> get props => [];
}


class UpdateShoppingCart extends ShoppingCartEvent {
  final List<dynamic> content;

  const UpdateShoppingCart(this.content);

  @override
  List<Object?> get props => content;
}

class UpdateShoppingCartItem extends ShoppingCartEvent {
  final int itemId;

  const UpdateShoppingCartItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class AddShoppingCartItem extends ShoppingCartEvent {
  final int itemId;
  final int quantity;

  const AddShoppingCartItem(this.itemId, this.quantity);

  @override
  List<Object?> get props => [itemId, quantity];
}

class DeleteShoppingCartItem extends ShoppingCartEvent {
  final int itemId;

  const DeleteShoppingCartItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
}

class ErrorShoppingCart extends ShoppingCartEvent {
  final String error;

  const ErrorShoppingCart(this.error);

  @override
  List<Object?> get props => [error];
}