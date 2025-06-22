part of 'get_point_view_cubit.dart';

@immutable
sealed class GetPointViewState {}

final class GetPointViewInitial extends GetPointViewState {}

final class GetPointViewLoading extends GetPointViewState {}

final class GetPointViewFailure extends GetPointViewState {
  final String errmessage;

  GetPointViewFailure({required this.errmessage});
}

final class GetPointViewSuccess extends GetPointViewState {
  final pointmodel points;

  GetPointViewSuccess({required this.points});
}
