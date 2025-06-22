import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/user_logs_model.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo.dart';

part 'get_user_logs_state.dart';

class GetUserLogsCubit extends Cubit<GetUserLogsState> {
  GetUserLogsCubit(this.homeRepo) : super(GetUserLogsInitial());
  final UserHomeRepo homeRepo;
  Future<void> getuserlogs({
    required String token,
    required int id,
  }) async {
    emit(GetUserLogsLoading());
    var result = await homeRepo.GetUserLogs(token: token, id: id);
    result.fold((Failure) {
      emit(GetUserLogsFailure(errmessage: Failure.errmessage));
    }, (logs) {
      emit(GetUserLogsSuccess(logs: logs));
    });
  }
}
