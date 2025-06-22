import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';

part 'add_price_state.dart';

class AddPriceCubit extends Cubit<AddPriceState> {
  AddPriceCubit(this.homeRepo) : super(AddPriceInitial());
  final PublicspotHomeRepo homeRepo;
  Future<void> addprice({
    required String token,
    required String pricePerHour,
    required String additionalGuestFees,
  }) async {
    if (isClosed) return;
    emit(AddPriceLoading());

    var result = await homeRepo.addprice(
        token: token,
        pricePerHour: pricePerHour,
        additionalGuestFees: additionalGuestFees);

    result.fold((failure) {
      if (!isClosed) {
        emit(AddPriceFailure(errmessage: failure.errmessage));
      }
    }, (msg) {
      if (!isClosed) {
        emit(AddPriceSuccess(message: msg));
      }
    });
  }
}
