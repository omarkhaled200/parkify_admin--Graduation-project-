part of 'add_price_cubit.dart';

@immutable
sealed class AddPriceState {}

final class AddPriceInitial extends AddPriceState {}

final class AddPriceLoading extends AddPriceState {}

final class AddPriceFailure extends AddPriceState {
  final String errmessage;

  AddPriceFailure({required this.errmessage});
}

final class AddPriceSuccess extends AddPriceState {
  final String message;

  AddPriceSuccess({required this.message});
}
