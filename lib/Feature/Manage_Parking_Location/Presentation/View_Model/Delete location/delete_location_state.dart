part of 'delete_location_cubit.dart';

@immutable
sealed class DeleteLocationState {}

final class DeleteLocationInitial extends DeleteLocationState {}

final class DeleteLocationLoading extends DeleteLocationState {}

final class DeleteLocationFailure extends DeleteLocationState {
  final String errmessage;

  DeleteLocationFailure({required this.errmessage});
}

final class DeleteLocationSuccess extends DeleteLocationState {
  final String message;

  DeleteLocationSuccess({required this.message});
}
