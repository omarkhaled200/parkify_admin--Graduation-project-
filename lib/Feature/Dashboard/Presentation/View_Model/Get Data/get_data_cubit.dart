import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_data_state.dart';

class GetDataCubit extends Cubit<GetDataState> {
  GetDataCubit(this.homeRepo) : super(GetDataInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetData({
    required String token,
    required int id,
  }) async {
    emit(GetDataLoading());
    var result = await homeRepo.getdata(token: token, id: id);
    result.fold((Failure) {
      emit(GetDataFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetDataSuccess(list: mes));
    });
  }
}
