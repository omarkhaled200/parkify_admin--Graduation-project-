part of 'edit_point_and_refund_cubit.dart';

@immutable
sealed class EditPointAndRefundState {}

final class EditPointAndRefundInitial extends EditPointAndRefundState {}

final class EditPointAndRefundLoading extends EditPointAndRefundState {}

final class EditPointAndRefundFailure extends EditPointAndRefundState {
  final String errmessage;

  EditPointAndRefundFailure({required this.errmessage});
}

final class EditPointAndRefundSuccess extends EditPointAndRefundState {
  final String message;

  EditPointAndRefundSuccess({required this.message});
}
