import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/AdminData/data/Repos/AdminData_Homr_Repo.dart';
import 'package:parkify_admin/Feature/AdminData/data/admin_data_model/admin_data_model.dart';

part 'get_all_admin_data_state.dart';

class GetAllAdminDataCubit extends Cubit<GetAllAdminDataState> {
  GetAllAdminDataCubit(this.homeRepo) : super(GetAllAdminDataInitial());
  final AdmindataHomrRepo homeRepo;
  Future<void> GetAllAdminData({
    required String token,
  }) async {
    emit(GetAllAdminDataLoading());
    var result = await homeRepo.getAllAdminData(
      token: token,
    );
    result.fold((Failure) {
      emit(GetAllAdminDataFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetAllAdminDataSuccess(data: mes));
    });
  }
}
