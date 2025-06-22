part of 'add_public_spots_cubit.dart';

@immutable
sealed class AddPublicSpotsState {}

final class AddPublicSpotsInitial extends AddPublicSpotsState {}

final class AddPublicSpotsLoading extends AddPublicSpotsState {}

final class AddPublicSpotsFailure extends AddPublicSpotsState {
  final String errmessage;

  AddPublicSpotsFailure({required this.errmessage});
}

final class AddPublicSpotsSuccess extends AddPublicSpotsState {
  final String message;

  AddPublicSpotsSuccess({required this.message});
}
