part of 'edit_reservable_spot_cubit.dart';

@immutable
sealed class EditReservableSpotState {}

final class EditReservableSpotInitial extends EditReservableSpotState {}

final class EditReservableSpotLoading extends EditReservableSpotState {}

final class EditReservableSpotFailure extends EditReservableSpotState {
  final String errmessage;

  EditReservableSpotFailure({required this.errmessage});
}

final class EditReservableSpotSuccess extends EditReservableSpotState {
  final String message;

  EditReservableSpotSuccess({required this.message});
}
