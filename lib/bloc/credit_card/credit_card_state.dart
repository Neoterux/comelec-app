part of 'credit_card_bloc.dart';

@immutable
sealed class CreditCardState extends Equatable {
  const CreditCardState();
}

class LoadingCreditCard extends CreditCardState {
  @override
  List<Object> get props => [];
}

class LoadedCreditCard extends CreditCardState {
  final List<dynamic> creditCards;

  const LoadedCreditCard(this.creditCards);

  @override
  List<Object> get props => [creditCards];
}

class CreatedCreditCard extends CreditCardState {
  final dynamic message;

  const CreatedCreditCard(this.message);

  @override
  List<Object> get props => [message];
}

class DeletingCreditCard extends CreditCardState {
  const DeletingCreditCard();

  @override
  List<Object> get props => [];
}

class DeletedCreditCard extends CreditCardState {
  final dynamic message;

  const DeletedCreditCard(this.message);

  @override
  List<Object> get props => [message];
}

class ErrorCreditCard extends CreditCardState {
  final String error;

  const ErrorCreditCard(this.error);

  @override
  List<Object> get props => [error];
}
