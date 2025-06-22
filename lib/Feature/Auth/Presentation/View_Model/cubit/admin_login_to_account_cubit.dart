import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Auth/data/Model/user_model/user_model.dart';
import 'package:parkify_admin/Feature/Auth/data/Repo_Auth/Home_Repo_Auth.dart';

part 'admin_login_to_account_state.dart';

class AdminLoginToAccountCubit extends Cubit<AdminLoginToAccountState> {
  AdminLoginToAccountCubit(this.homeRepo) : super(AdminLoginToAccountInitial());
  final HomeRepoAuth homeRepo;
  Future<void> AdminLogin(
      {required String email, required String password}) async {
    emit(AdminLoginToAccountLoading());
    var result = await homeRepo.postLogin(email: email, password: password);
    result.fold((Failure) {
      emit(AdminLoginToAccountFailure(errmessage: Failure.errmessage));
    }, (admin) {
      emit(AdminLoginToAccountSuccess(admin: admin));
    });
  }
}
