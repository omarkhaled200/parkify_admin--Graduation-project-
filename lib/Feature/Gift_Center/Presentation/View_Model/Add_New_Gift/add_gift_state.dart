part of 'add_gift_cubit.dart';

@immutable
sealed class AddGiftState {}

final class AddGiftInitial extends AddGiftState {}

final class AddGiftLoading extends AddGiftState {}

final class AddGiftFailure extends AddGiftState {
  final String errmessage;

  AddGiftFailure({required this.errmessage});
}

final class AddGiftSuccess extends AddGiftState {
  final String message;

  AddGiftSuccess({required this.message});
}
