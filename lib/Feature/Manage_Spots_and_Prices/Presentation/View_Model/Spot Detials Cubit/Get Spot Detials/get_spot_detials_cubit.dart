import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spot%20Details%20Repos/spot_details_repos_impl.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spotdetialsmodel/spotdetialsmodel.dart';

part 'get_spot_detials_state.dart';

class GetSpotDetialsCubit extends Cubit<GetSpotDetialsState> {
  GetSpotDetialsCubit(this.homeRepo) : super(GetSpotDetialsInitial());
  final SpotDetailsReposImpl homeRepo;
  Future<void> getSpotDetials({required String token}) async {
    if (isClosed) return;
    emit(GetSpotDetialsLoading());

    var result = await homeRepo.GetSpotdetials(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetSpotDetialsFailure(errmessage: failure.errmessage));
      }
    }, (spot) {
      if (!isClosed) {
        emit(GetSpotDetialsSuccess(spot: spot));
      }
    });
  }
}
