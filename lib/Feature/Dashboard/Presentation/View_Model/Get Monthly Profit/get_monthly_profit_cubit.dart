import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_monthly_profit_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_monthly_profit_state.dart';

class GetMonthlyProfitCubit extends Cubit<GetMonthlyProfitState> {
  GetMonthlyProfitCubit(this.homeRepo) : super(GetMonthlyProfitInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetMonthlyProfit({
    required String token,
    required int id,
  }) async {
    emit(GetMonthlyProfitLoading());
    var result = await homeRepo.getMonthlyProfit(token: token, id: id);
    result.fold((Failure) {
      emit(GetMonthlyProfitFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetMonthlyProfitSuccess(profit: mes));
    });
  }
}
