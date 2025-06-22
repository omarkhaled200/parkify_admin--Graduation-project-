import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';

part 'delete_public_spots_state.dart';

class DeletePublicSpotsCubit extends Cubit<DeletePublicSpotsState> {
  DeletePublicSpotsCubit(this.homeRepo) : super(DeletePublicSpotsInitial());
  final PublicspotHomeRepo homeRepo;
  Future<void> DeleteReservableSpot({
    required String token,
    required String id,
  }) async {
    if (isClosed) return;
    emit(DeletePublicSpotsLoading());

    var result = await homeRepo.DeletePublicSpot(token: token, id: id);

    result.fold((failure) {
      if (!isClosed) {
        emit(DeletePublicSpotsFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(DeletePublicSpotsSuccess(message: msg));
      }
    });
  }
}
