import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo.dart';

part 'change_user_status_state.dart';

class ChangeUserStatusCubit extends Cubit<ChangeUserStatusState> {
  ChangeUserStatusCubit(this.homeRepo) : super(ChangeUserStatusInitial());
  final UserHomeRepo homeRepo;
  Future<void> changeuserstatus({
    required String token,
    required int id,
    required String status,
  }) async {
    emit(ChangeUserStatusLoading());
    var result =
        await homeRepo.ChangeUserStatus(token: token, id: id, status: status);
    result.fold((Failure) {
      emit(ChangeUserStatusFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(ChangeUserStatusSuccess(message: msg));
    });
  }
}
