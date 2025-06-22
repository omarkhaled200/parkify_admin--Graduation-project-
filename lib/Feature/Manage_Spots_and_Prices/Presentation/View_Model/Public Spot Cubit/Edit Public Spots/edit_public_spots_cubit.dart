import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';

part 'edit_public_spots_state.dart';

class EditPublicSpotsCubit extends Cubit<EditPublicSpotsState> {
  EditPublicSpotsCubit(this.homeRepo) : super(EditPublicSpotsInitial());
  final PublicspotHomeRepo homeRepo;
  Future<void> EditReservableSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    if (isClosed) return;
    emit(EditPublicSpotsLoading());

    var result = await homeRepo.EditPublicSpot(
        id: id,
        token: token,
        spotcode: spotcode,
        managementid: managementid,
        locationid: locationid);

    result.fold((failure) {
      if (!isClosed) {
        emit(EditPublicSpotsFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(EditPublicSpotsSuccess(message: msg));
      }
    });
  }
}
