part of 'shopping_cart_bloc.dart';

@immutable
sealed class ShoppingCartState extends Equatable {
  const ShoppingCartState();
}

class LoadingShoppingCart extends ShoppingCartState {
  @override
  List<Object> get props => [];
}

class LoadedShoppingCart extends ShoppingCartState {
  final List<dynamic> content;

  const LoadedShoppingCart(this.content);

  @override
  List<Object> get props => [content];
}

class UpdatedShoppingCart extends ShoppingCartState {
  final List<dynamic> content;

  const UpdatedShoppingCart(this.content);

  @override
  List<Object> get props => [content];
}

class RemovedItemOnShoppingCart extends ShoppingCartState {
  const RemovedItemOnShoppingCart();

  @override
  List<Object> get props => [];
}

class UpdatedItemOnShoppingCart extends ShoppingCartState {
  const UpdatedItemOnShoppingCart();

  @override
  List<Object> get props => [];
}