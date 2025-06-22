part of 'get_popular_reservable_spot_cubit.dart';

@immutable
sealed class GetPopularReservableSpotState {}

final class GetPopularReservableSpotInitial
    extends GetPopularReservableSpotState {}

final class GetPopularReservableSpotLoading
    extends GetPopularReservableSpotState {}

final class GetPopularReservableSpotFailure
    extends GetPopularReservableSpotState {
  final String errmessage;

  GetPopularReservableSpotFailure({required this.errmessage});
}

final class GetPopularReservableSpotSuccess
    extends GetPopularReservableSpotState {
  final List<GetPopularReservableSpotModel> reservable;

  GetPopularReservableSpotSuccess({required this.reservable});
}
