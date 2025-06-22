import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/public_spot_modal/public_spot_modal.dart';

part 'get_public_spots_state.dart';

class GetPublicSpotsCubit extends Cubit<GetPublicSpotsState> {
  GetPublicSpotsCubit(this.homeRepo) : super(GetPublicSpotsInitial());
  final PublicspotHomeRepo homeRepo;
  Future<void> getPublicSpot({required String token}) async {
    if (isClosed) return;
    emit(GetPublicSpotsLoading());

    var result = await homeRepo.GetPublicSpot(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetPublicSpotsFailure(errmessage: failure.errmessage));
      }
    }, (spot) {
      if (!isClosed) {
        emit(GetPublicSpotsSuccess(spot: spot));
      }
    });
  }
}
