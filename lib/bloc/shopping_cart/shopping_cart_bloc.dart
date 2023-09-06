import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:comelec/repositories/shopping_cart_repository.dart';

part 'shopping_cart_event.dart';
part 'shopping_cart_state.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, ShoppingCartState> {
  final ShoppingCartRepository _cartRepository;

  ShoppingCartBloc(this._cartRepository) : super(LoadingShoppingCart()) {
    on<GetShoppingCartContent>(_onGetShoppingCartContent);

  }

  void _onGetShoppingCartContent(ShoppingCartEvent event, Emitter emit) async {
    emit(LoadingShoppingCart());
    try {
      final content = await _cartRepository.getShoppingCartContent();
      emit(LoadedShoppingCart(content));
    } catch(e) {
      emit(ErrorShoppingCart(e.toString()));
    }
  }

  void _onUpdateShoppingCartContent(UpdateShoppingCart event, Emitter emit) async {
    emit(LoadingShoppingCart());
    try {
      final content = await _cartRepository.updateCart(event.content);
      emit(LoadedShoppingCart(content));
    } catch(e) {
      emit(ErrorShoppingCart(e.toString()));
    }
  }

}