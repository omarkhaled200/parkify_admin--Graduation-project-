part of 'get_all_user_cubit.dart';

@immutable
sealed class GetAllUserState {}

final class GetAllUserInitial extends GetAllUserState {}

final class GetAllUserLoading extends GetAllUserState {}

final class GetAllUserFailure extends GetAllUserState {
  final String errmessage;

  GetAllUserFailure({required this.errmessage});
}

final class GetAllUserSuccess extends GetAllUserState {
  final List<Users> users;

  GetAllUserSuccess({required this.users});
}
