import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';

part 'delete_gift_state.dart';

class DeleteGiftCubit extends Cubit<DeleteGiftState> {
  DeleteGiftCubit(this.homeRepo) : super(DeleteGiftInitial());
  final GiftHomeRepo homeRepo;
  Future<void> deletegift({required String token, required String id}) async {
    emit(DeleteGiftLoading());
    var result = await homeRepo.DeleteGift(token: token, id: id);
    result.fold((Failure) {
      emit(DeleteGiftFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(DeleteGiftSuccess(message: msg));
    });
  }
}
