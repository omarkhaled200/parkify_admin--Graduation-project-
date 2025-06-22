part of 'get_all_admin_data_cubit.dart';

@immutable
sealed class GetAllAdminDataState {}

final class GetAllAdminDataInitial extends GetAllAdminDataState {}

final class GetAllAdminDataLoading extends GetAllAdminDataState {}

final class GetAllAdminDataFailure extends GetAllAdminDataState {
  final String errmessage;

  GetAllAdminDataFailure({required this.errmessage});
}

final class GetAllAdminDataSuccess extends GetAllAdminDataState {
  final List<AdminDataModel> data;

  GetAllAdminDataSuccess({required this.data});
}
