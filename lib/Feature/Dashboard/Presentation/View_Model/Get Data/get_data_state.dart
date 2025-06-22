part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}

final class GetDataLoading extends GetDataState {}

final class GetDataFailure extends GetDataState {
  final String errmessage;

  GetDataFailure({required this.errmessage});
}

final class GetDataSuccess extends GetDataState {
  final List<String> list;

  GetDataSuccess({required this.list});
}
