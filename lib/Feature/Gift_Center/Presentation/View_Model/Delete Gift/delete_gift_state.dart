part of 'delete_gift_cubit.dart';

@immutable
sealed class DeleteGiftState {}

final class DeleteGiftInitial extends DeleteGiftState {}

final class DeleteGiftLoading extends DeleteGiftState {}

final class DeleteGiftFailure extends DeleteGiftState {
  final String errmessage;

  DeleteGiftFailure({required this.errmessage});
}

final class DeleteGiftSuccess extends DeleteGiftState {
  final String message;

  DeleteGiftSuccess({required this.message});
}
