import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';

part 'change_location_status_state.dart';

class ChangeLocationStatusCubit extends Cubit<ChangeLocationStatusState> {
  ChangeLocationStatusCubit(this.homeRepo)
      : super(ChangeLocationStatusInitial());
  final LocationHomeRepo homeRepo;
  Future<void> changelocationstatus({
    required String token,
    required int id,
    required String status,
  }) async {
    emit(ChangeLocationStatusLoading());
    var result = await homeRepo.ChangeLocationStatus(
        token: token, id: id, status: status);
    result.fold((Failure) {
      emit(ChangeLocationStatusFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(ChangeLocationStatusSuccess(message: msg));
    });
  }
}
