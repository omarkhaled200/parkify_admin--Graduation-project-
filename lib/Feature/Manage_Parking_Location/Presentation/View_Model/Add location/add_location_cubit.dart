import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';

part 'add_location_state.dart';

class AddLocationCubit extends Cubit<AddLocationState> {
  AddLocationCubit(this.homeRepo) : super(AddLocationInitial());
  final LocationHomeRepo homeRepo;
  Future<void> addlocation(
      {required String token,
      required String name,
      required String address,
      required String gpslocation}) async {
    emit(AddLocationLoading());
    var result = await homeRepo.AddLocation(
        token: token, name: name, address: address, gpslocation: gpslocation);
    result.fold((Failure) {
      emit(AddLocationFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(AddLocationSuccess(message: mes));
    });
  }
}
