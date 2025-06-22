part of 'get_spot_detials_cubit.dart';

@immutable
sealed class GetSpotDetialsState {}

final class GetSpotDetialsInitial extends GetSpotDetialsState {}

final class GetSpotDetialsLoading extends GetSpotDetialsState {}

final class GetSpotDetialsFailure extends GetSpotDetialsState {
  final String errmessage;

  GetSpotDetialsFailure({required this.errmessage});
}

final class GetSpotDetialsSuccess extends GetSpotDetialsState {
  final List<Spotdetialsmodel> spot;

  GetSpotDetialsSuccess({required this.spot});
}
