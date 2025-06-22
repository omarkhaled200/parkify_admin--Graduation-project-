part of 'change_location_status_cubit.dart';

@immutable
sealed class ChangeLocationStatusState {}

final class ChangeLocationStatusInitial extends ChangeLocationStatusState {}

final class ChangeLocationStatusLoading extends ChangeLocationStatusState {}

final class ChangeLocationStatusFailure extends ChangeLocationStatusState {
  final String errmessage;

  ChangeLocationStatusFailure({required this.errmessage});
}

final class ChangeLocationStatusSuccess extends ChangeLocationStatusState {
  final String message;

  ChangeLocationStatusSuccess({required this.message});
}
