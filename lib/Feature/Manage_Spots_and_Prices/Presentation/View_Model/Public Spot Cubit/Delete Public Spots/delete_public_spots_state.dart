part of 'delete_public_spots_cubit.dart';

@immutable
sealed class DeletePublicSpotsState {}

final class DeletePublicSpotsInitial extends DeletePublicSpotsState {}

final class DeletePublicSpotsLoading extends DeletePublicSpotsState {}

final class DeletePublicSpotsFailure extends DeletePublicSpotsState {
  final String errmessage;

  DeletePublicSpotsFailure({required this.errmessage});
}

final class DeletePublicSpotsSuccess extends DeletePublicSpotsState {
  final String message;

  DeletePublicSpotsSuccess({required this.message});
}
