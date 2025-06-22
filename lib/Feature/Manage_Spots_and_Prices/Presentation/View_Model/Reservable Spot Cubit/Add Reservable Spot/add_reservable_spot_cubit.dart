import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo.dart';

part 'add_reservable_spot_state.dart';

class AddReservableSpotCubit extends Cubit<AddReservableSpotState> {
  AddReservableSpotCubit(this.homeRepo) : super(AddReservableSpotInitial());
  final ReservablespotHomeRepo homeRepo;
  Future<void> addreservablespot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    if (isClosed) return;
    emit(AddReservableSpotLoading());

    var result = await homeRepo.AddReservableSpot(
        token: token,
        spotcode: spotcode,
        managementid: managementid,
        locationid: locationid);

    result.fold((failure) {
      if (!isClosed) {
        emit(AddReservableSpotFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(AddReservableSpotSuccess(message: msg));
      }
    });
  }
}
