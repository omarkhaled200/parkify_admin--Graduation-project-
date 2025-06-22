import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';

part 'edit_location_state.dart';

class EditLocationCubit extends Cubit<EditLocationState> {
  EditLocationCubit(this.homeRepo) : super(EditLocationInitial());
  final LocationHomeRepo homeRepo;
  Future<void> editlocation(
      {required String token,
      required int id,
      required String name,
      required String address,
      required String gpslocation}) async {
    emit(EditLocationLoading());
    var result = await homeRepo.EditLocation(
        id: id,
        token: token,
        name: name,
        address: address,
        gpslocation: gpslocation);
    result.fold((Failure) {
      emit(EditLocationFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(EditLocationSuccess(message: msg));
    });
  }
}
