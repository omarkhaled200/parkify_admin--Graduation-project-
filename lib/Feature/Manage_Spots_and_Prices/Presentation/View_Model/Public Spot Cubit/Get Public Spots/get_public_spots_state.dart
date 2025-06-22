part of 'get_public_spots_cubit.dart';

@immutable
sealed class GetPublicSpotsState {}

final class GetPublicSpotsInitial extends GetPublicSpotsState {}

final class GetPublicSpotsLoading extends GetPublicSpotsState {}

final class GetPublicSpotsFailure extends GetPublicSpotsState {
  final String errmessage;

  GetPublicSpotsFailure({required this.errmessage});
}

final class GetPublicSpotsSuccess extends GetPublicSpotsState {
  final List<PublicSpotModal> spot;

  GetPublicSpotsSuccess({required this.spot});
}
