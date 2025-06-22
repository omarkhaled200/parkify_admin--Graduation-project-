import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';

part 'add_public_spots_state.dart';

class AddPublicSpotsCubit extends Cubit<AddPublicSpotsState> {
  AddPublicSpotsCubit(this.homeRepo) : super(AddPublicSpotsInitial());
  final PublicspotHomeRepo homeRepo;
  Future<void> addPublicpot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    if (isClosed) return;
    emit(AddPublicSpotsLoading());

    var result = await homeRepo.AddPublicSpot(
        token: token,
        spotcode: spotcode,
        managementid: managementid,
        locationid: locationid);

    result.fold((failure) {
      if (!isClosed) {
        emit(AddPublicSpotsFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(AddPublicSpotsSuccess(message: msg));
      }
    });
  }
}
