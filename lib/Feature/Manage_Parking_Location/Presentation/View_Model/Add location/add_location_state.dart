part of 'add_location_cubit.dart';

@immutable
sealed class AddLocationState {}

final class AddLocationInitial extends AddLocationState {}

final class AddLocationLoading extends AddLocationState {}

final class AddLocationFailure extends AddLocationState {
  final String errmessage;

  AddLocationFailure({required this.errmessage});
}

final class AddLocationSuccess extends AddLocationState {
  final String message;

  AddLocationSuccess({required this.message});
}
