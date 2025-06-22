part of 'get_reservable_spots_cubit.dart';

sealed class GetReservableSpotsState {}

final class GetReservableSpotsInitial extends GetReservableSpotsState {}

final class GetReservableSpotsLoading extends GetReservableSpotsState {}

final class GetReservableSpotsFailure extends GetReservableSpotsState {
  final String errmessage;

  GetReservableSpotsFailure({required this.errmessage});
}

final class GetReservableSpotsSuccess extends GetReservableSpotsState {
  final List<ReservableSpotModel> spot;

  GetReservableSpotsSuccess({required this.spot});
}
