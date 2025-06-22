part of 'delete_reservable_spot_cubit.dart';

@immutable
sealed class DeleteReservableSpotState {}

final class DeleteReservableSpotInitial extends DeleteReservableSpotState {}

final class DeleteReservableSpotLoading extends DeleteReservableSpotState {}

final class DeleteReservableSpotFailure extends DeleteReservableSpotState {
  final String errmessage;

  DeleteReservableSpotFailure({required this.errmessage});
}

final class DeleteReservableSpotSuccess extends DeleteReservableSpotState {
  final String message;

  DeleteReservableSpotSuccess({required this.message});
}
