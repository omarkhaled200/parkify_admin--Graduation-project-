part of 'get_user_logs_cubit.dart';

@immutable
sealed class GetUserLogsState {}

final class GetUserLogsInitial extends GetUserLogsState {}

final class GetUserLogsLoading extends GetUserLogsState {}

final class GetUserLogsFailure extends GetUserLogsState {
  final String errmessage;

  GetUserLogsFailure({required this.errmessage});
}

final class GetUserLogsSuccess extends GetUserLogsState {
  final UserLogsModel logs;

  GetUserLogsSuccess({required this.logs});
}
