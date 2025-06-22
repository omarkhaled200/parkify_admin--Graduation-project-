part of 'get_all_location_report_cubit.dart';

@immutable
sealed class GetAllLocationReportState {}

final class GetAllLocationReportInitial extends GetAllLocationReportState {}

final class GetAllLocationReportLoading extends GetAllLocationReportState {}

final class GetAllLocationReportFailure extends GetAllLocationReportState {
  final String errmessage;

  GetAllLocationReportFailure({required this.errmessage});
}

final class GetAllLocationReportSuccess extends GetAllLocationReportState {
  final String report;

  GetAllLocationReportSuccess({required this.report});
}
