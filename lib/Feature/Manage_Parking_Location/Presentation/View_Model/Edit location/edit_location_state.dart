part of 'edit_location_cubit.dart';

@immutable
sealed class EditLocationState {}

final class EditLocationInitial extends EditLocationState {}

final class EditLocationLoading extends EditLocationState {}

final class EditLocationFailure extends EditLocationState {
  final String errmessage;

  EditLocationFailure({required this.errmessage});
}

final class EditLocationSuccess extends EditLocationState {
  final String message;

  EditLocationSuccess({required this.message});
}
