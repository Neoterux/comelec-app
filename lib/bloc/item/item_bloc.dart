import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:comelec/repositories/item_respository.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  final ItemRepository _itemRepository;

  ItemBloc(this._itemRepository) : super(LoadingItem()) {
    on<GetItems>(_onGetItems);
    on<CreateItem>(_onCreateItem);
    on<DeleteItem>(_onDeleteItem);
    on<UpdateItem>(_onUpdateItem);
  }

  void _onGetItems(GetItems event, Emitter emit) async {
    emit(LoadingItem());
    try {
      final items = await _itemRepository.getItems();
      emit(LoadedItem(items));
    } catch (e) {
      emit(ErrorItem(e.toString()));
    }
  }

  void _onCreateItem(CreateItem event, Emitter emit) async {
    emit(LoadingItem());
    try {
      var jsonResponse =
          await _itemRepository.createItems(event.item);
      emit(CreatedItem(jsonResponse));
    } catch (e) {
      emit(ErrorItem(e.toString()));
    }
  }

  void _onDeleteItem(DeleteItem event, Emitter emit) async {
    emit(LoadingItem());
    try {
      var jsonResponse =
          await _itemRepository.deleteItem(event.itemId);
      emit(DeletedItem(jsonResponse));
    } catch (e) {
      emit(ErrorItem(e.toString()));
    }
  }

  void _onUpdateItem(UpdateItem event, Emitter emit) async {
    emit(LoadingItem());
    try {
      var jsonResponse =
      await _itemRepository.updateItems(event.item, event.itemId);
      emit(UpdatedItem(jsonResponse));
    } catch (e) {
      emit(ErrorItem(e.toString()));
    }
  }
}
