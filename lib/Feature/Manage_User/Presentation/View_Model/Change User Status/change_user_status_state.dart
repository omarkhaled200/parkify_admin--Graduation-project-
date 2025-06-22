part of 'change_user_status_cubit.dart';

@immutable
sealed class ChangeUserStatusState {}

final class ChangeUserStatusInitial extends ChangeUserStatusState {}

final class ChangeUserStatusLoading extends ChangeUserStatusState {}

final class ChangeUserStatusFailure extends ChangeUserStatusState {
  final String errmessage;

  ChangeUserStatusFailure({required this.errmessage});
}

final class ChangeUserStatusSuccess extends ChangeUserStatusState {
  final String message;

  ChangeUserStatusSuccess({required this.message});
}
