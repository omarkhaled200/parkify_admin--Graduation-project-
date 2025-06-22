part of 'edit_gift_cubit.dart';

@immutable
sealed class EditGiftState {}

final class EditGiftInitial extends EditGiftState {}

final class EditGiftLoading extends EditGiftState {}

final class EditGiftFailure extends EditGiftState {
  final String errmessage;

  EditGiftFailure({required this.errmessage});
}

final class EditGiftSuccess extends EditGiftState {
  final String message;

  EditGiftSuccess({required this.message});
}
