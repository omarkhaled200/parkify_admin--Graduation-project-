import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/users/users.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo.dart';

part 'get_all_user_state.dart';

class GetAllUserCubit extends Cubit<GetAllUserState> {
  GetAllUserCubit(this.homeRepo) : super(GetAllUserInitial());
  final UserHomeRepo homeRepo;
  Future<void> GetallUsers({required String token}) async {
    emit(GetAllUserLoading());
    var result = await homeRepo.GetAllUser(token: token);
    result.fold((Failure) {
      emit(GetAllUserFailure(errmessage: Failure.errmessage));
    }, (users) {
      emit(GetAllUserSuccess(users: users));
    });
  }
}
