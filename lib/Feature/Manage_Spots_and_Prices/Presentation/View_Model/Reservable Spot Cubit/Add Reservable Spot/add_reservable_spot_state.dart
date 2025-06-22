part of 'add_reservable_spot_cubit.dart';

@immutable
sealed class AddReservableSpotState {}

final class AddReservableSpotInitial extends AddReservableSpotState {}

final class AddReservableSpotLoading extends AddReservableSpotState {}

final class AddReservableSpotFailure extends AddReservableSpotState {
  final String errmessage;

  AddReservableSpotFailure({required this.errmessage});
}

final class AddReservableSpotSuccess extends AddReservableSpotState {
  final String message;

  AddReservableSpotSuccess({required this.message});
}
