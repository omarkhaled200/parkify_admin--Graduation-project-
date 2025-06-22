import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_public_spot_model/get_popular_public_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_popular_public_spot_state.dart';

class GetPopularPublicSpotCubit extends Cubit<GetPopularPublicSpotState> {
  GetPopularPublicSpotCubit(this.homeRepo)
      : super(GetPopularPublicSpotInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetPopularPublicSpot({
    required String token,
    required int id,
  }) async {
    emit(GetPopularPublicSpotLoading());
    var result = await homeRepo.getpopularPublicSpot(token: token, id: id);
    result.fold((Failure) {
      emit(GetPopularPublicSpotFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetPopularPublicSpotSuccess(public: mes));
    });
  }
}
