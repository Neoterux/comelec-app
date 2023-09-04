part of 'credit_card_bloc.dart';

@immutable
sealed class CreditCardEvent extends Equatable {
  const CreditCardEvent();
}

class GetCreditCards extends CreditCardEvent {
  const GetCreditCards();

  @override
  List<Object?> get props => [];
}

class DeleteCreditCard extends CreditCardEvent {
  final int creditCardId;

  const DeleteCreditCard(this.creditCardId);

  @override
  List<Object?> get props => [creditCardId];
}

class CreateCreditCard extends CreditCardEvent {
  final dynamic creditCard;

  const CreateCreditCard(this.creditCard);

  @override
  List<Object?> get props => [creditCard];
}
