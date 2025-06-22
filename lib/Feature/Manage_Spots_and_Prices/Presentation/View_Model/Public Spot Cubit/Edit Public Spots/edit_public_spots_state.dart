part of 'edit_public_spots_cubit.dart';

@immutable
sealed class EditPublicSpotsState {}

final class EditPublicSpotsInitial extends EditPublicSpotsState {}

final class EditPublicSpotsLoading extends EditPublicSpotsState {}

final class EditPublicSpotsFailure extends EditPublicSpotsState {
  final String errmessage;

  EditPublicSpotsFailure({required this.errmessage});
}

final class EditPublicSpotsSuccess extends EditPublicSpotsState {
  final String message;

  EditPublicSpotsSuccess({required this.message});
}
