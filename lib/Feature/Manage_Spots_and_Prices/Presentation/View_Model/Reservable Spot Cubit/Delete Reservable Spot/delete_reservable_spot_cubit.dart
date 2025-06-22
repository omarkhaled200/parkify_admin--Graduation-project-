import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo.dart';

part 'delete_reservable_spot_state.dart';

class DeleteReservableSpotCubit extends Cubit<DeleteReservableSpotState> {
  DeleteReservableSpotCubit(this.homeRepo)
      : super(DeleteReservableSpotInitial());
  final ReservablespotHomeRepo homeRepo;
  Future<void> DeleteReservableSpot({
    required String token,
    required String id,
  }) async {
    if (isClosed) return;
    emit(DeleteReservableSpotLoading());

    var result = await homeRepo.DeleteReservableSpot(token: token, id: id);

    result.fold((failure) {
      if (!isClosed) {
        emit(DeleteReservableSpotFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(DeleteReservableSpotSuccess(message: msg));
      }
    });
  }
}
