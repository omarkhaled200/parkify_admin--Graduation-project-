import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_all_location_report_state.dart';

class GetAllLocationReportCubit extends Cubit<GetAllLocationReportState> {
  GetAllLocationReportCubit(this.homeRepo)
      : super(GetAllLocationReportInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetAllLocationReport({
    required String token,
    required int id,
  }) async {
    emit(GetAllLocationReportLoading());
    var result = await homeRepo.getalllocationreport(token: token, id: id);
    result.fold((Failure) {
      emit(GetAllLocationReportFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetAllLocationReportSuccess(report: mes));
    });
  }
}
