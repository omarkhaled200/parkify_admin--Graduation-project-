import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_reservable_spot_model/get_popular_reservable_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_popular_reservable_spot_state.dart';

class GetPopularReservableSpotCubit
    extends Cubit<GetPopularReservableSpotState> {
  GetPopularReservableSpotCubit(this.homeRepo)
      : super(GetPopularReservableSpotInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetPopularReservableSpot({
    required String token,
    required int id,
  }) async {
    emit(GetPopularReservableSpotLoading());
    var result = await homeRepo.getPopluarReservableSpot(token: token, id: id);
    result.fold((Failure) {
      emit(GetPopularReservableSpotFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetPopularReservableSpotSuccess(reservable: mes));
    });
  }
}
