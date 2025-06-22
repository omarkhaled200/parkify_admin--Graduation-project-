import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_user_account_status.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_user_account_status_state.dart';

class GetUserAccountStatusCubit extends Cubit<GetUserAccountStatusState> {
  GetUserAccountStatusCubit(this.homeRepo)
      : super(GetUserAccountStatusInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetUserAccountStatus({
    required String token,
  }) async {
    emit(GetUserAccountStatusLoading());
    var result = await homeRepo.getUseraccountstatus(token: token);
    result.fold((Failure) {
      emit(GetUserAccountStatusFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetUserAccountStatusSuccess(status: mes));
    });
  }
}
