import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo.dart';

part 'edit_reservable_spot_state.dart';

class EditReservableSpotCubit extends Cubit<EditReservableSpotState> {
  EditReservableSpotCubit(this.homeRepo) : super(EditReservableSpotInitial());
  final ReservablespotHomeRepo homeRepo;
  Future<void> EditReservableSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    if (isClosed) return;
    emit(EditReservableSpotLoading());

    var result = await homeRepo.EditReservableSpot(
        id: id,
        token: token,
        spotcode: spotcode,
        managementid: managementid,
        locationid: locationid);

    result.fold((failure) {
      if (!isClosed) {
        emit(EditReservableSpotFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(EditReservableSpotSuccess(message: msg));
      }
    });
  }
}
