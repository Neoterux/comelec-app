import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:comelec/repositories/credit_card_respository.dart';

part 'credit_card_event.dart';
part 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  final CreditCardRepository _creditCardRepository;

  CreditCardBloc(this._creditCardRepository) : super(LoadingCreditCard()) {
    on<GetCreditCards>(_onGetCreditCards);
    on<CreateCreditCard>(_onCreateCreditCard);
    on<DeleteCreditCard>(_onDeleteCreditCard);
  }

  void _onGetCreditCards(CreditCardEvent event, Emitter emit) async {
    emit(LoadingCreditCard());
    try {
      final creditCards = await _creditCardRepository.getCreditCards();
      emit(LoadedCreditCard(creditCards));
    } catch (e) {
      emit(ErrorCreditCard(e.toString()));
    }
  }

  void _onCreateCreditCard(CreateCreditCard event, Emitter emit) async {
    emit(LoadingCreditCard());
    try {
      var jsonResponse =
          await _creditCardRepository.createCreditCards(event.creditCard);
      emit(CreatedCreditCard(jsonResponse));
    } catch (e) {
      emit(ErrorCreditCard(e.toString()));
    }
  }

  void _onDeleteCreditCard(DeleteCreditCard event, Emitter emit) async {
    emit(DeletingCreditCard());
    try {
      var jsonResponse =
          await _creditCardRepository.deleteCreditCard(event.creditCardId);
      emit(DeletedCreditCard(jsonResponse));
    } catch (e) {
      emit(ErrorCreditCard(e.toString()));
    }
  }
}
