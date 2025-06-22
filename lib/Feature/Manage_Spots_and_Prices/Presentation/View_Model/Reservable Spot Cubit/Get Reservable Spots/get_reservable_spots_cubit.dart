import 'package:bloc/bloc.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/reservabile_spot_model/reservabile_spot_model.dart';

part 'get_reservable_spots_state.dart';

class GetReservableSpotsCubit extends Cubit<GetReservableSpotsState> {
  GetReservableSpotsCubit(this.homeRepo) : super(GetReservableSpotsInitial());
  final ReservablespotHomeRepo homeRepo;
  Future<void> getReservablespot({required String token}) async {
    if (isClosed) return;
    emit(GetReservableSpotsLoading());

    var result = await homeRepo.GetReservableSpot(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetReservableSpotsFailure(errmessage: failure.errmessage));
      }
    }, (spot) {
      if (!isClosed) {
        emit(GetReservableSpotsSuccess(spot: spot));
      }
    });
  }
}
