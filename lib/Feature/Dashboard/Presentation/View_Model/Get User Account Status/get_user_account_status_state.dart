part of 'get_user_account_status_cubit.dart';

@immutable
sealed class GetUserAccountStatusState {}

final class GetUserAccountStatusInitial extends GetUserAccountStatusState {}

final class GetUserAccountStatusLoading extends GetUserAccountStatusState {}

final class GetUserAccountStatusFailure extends GetUserAccountStatusState {
  final String errmessage;

  GetUserAccountStatusFailure({required this.errmessage});
}

final class GetUserAccountStatusSuccess extends GetUserAccountStatusState {
  final GetUserAccountStatus status;

  GetUserAccountStatusSuccess({required this.status});
}
