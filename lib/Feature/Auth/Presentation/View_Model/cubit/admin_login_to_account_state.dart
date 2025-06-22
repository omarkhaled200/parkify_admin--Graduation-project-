part of 'admin_login_to_account_cubit.dart';

@immutable
sealed class AdminLoginToAccountState {}

final class AdminLoginToAccountInitial extends AdminLoginToAccountState {}

final class AdminLoginToAccountLoading extends AdminLoginToAccountState {}

final class AdminLoginToAccountFailure extends AdminLoginToAccountState {
  final String errmessage;

  AdminLoginToAccountFailure({required this.errmessage});
}

final class AdminLoginToAccountSuccess extends AdminLoginToAccountState {
  final AdminModel admin;

  AdminLoginToAccountSuccess({required this.admin});
}
