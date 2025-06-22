import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';

part 'get_all_locations_state.dart';

class GetAllLocationsCubit extends Cubit<GetAllLocationsState> {
  GetAllLocationsCubit(this.homeRepo) : super(GetAllLocationsInitial());
  final LocationHomeRepo homeRepo;
  Future<void> getAlllocation({required String token}) async {
    if (isClosed) return;
    emit(GetAllLocationsLoading());

    var result = await homeRepo.GetAllLocations(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetAllLocationsFailure(errmessage: failure.errmessage));
      }
    }, (loc) {
      if (!isClosed) {
        emit(GetAllLocationsSuccess(location: loc));
      }
    });
  }
}
