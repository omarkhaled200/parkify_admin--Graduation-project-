import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';

part 'delete_location_state.dart';

class DeleteLocationCubit extends Cubit<DeleteLocationState> {
  DeleteLocationCubit(this.homeRepo) : super(DeleteLocationInitial());
  final LocationHomeRepo homeRepo;
  Future<void> deletelocation(
      {required String token, required String id}) async {
    emit(DeleteLocationLoading());
    var result = await homeRepo.DeleteLocation(token: token, id: id);
    result.fold((Failure) {
      emit(DeleteLocationFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(DeleteLocationSuccess(message: msg));
    });
  }
}
