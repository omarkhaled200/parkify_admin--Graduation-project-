import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';

part 'edit_gift_state.dart';

class EditGiftCubit extends Cubit<EditGiftState> {
  EditGiftCubit(this.homeRepo) : super(EditGiftInitial());
  final GiftHomeRepo homeRepo;
  Future<void> editGift(
      {required String token,
      required int id,
      required String description,
      required String cost,
      required String discount}) async {
    emit(EditGiftLoading());
    var result = await homeRepo.EditGift(
        id: id,
        token: token,
        description: description,
        cost: cost,
        discount: discount);
    result.fold((Failure) {
      emit(EditGiftFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(EditGiftSuccess(message: msg));
    });
  }
}
