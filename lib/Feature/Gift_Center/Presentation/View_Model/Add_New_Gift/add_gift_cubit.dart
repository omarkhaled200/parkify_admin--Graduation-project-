import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';

part 'add_gift_state.dart';

class AddGiftCubit extends Cubit<AddGiftState> {
  AddGiftCubit(this.homeRepo) : super(AddGiftInitial());
  final GiftHomeRepo homeRepo;
  Future<void> addGift(
      {required String token,
      required String description,
      required String cost,
      required String discount}) async {
    emit(AddGiftLoading());
    var result = await homeRepo.AddGift(
        token: token, description: description, cost: cost, discount: discount);
    result.fold((Failure) {
      emit(AddGiftFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(AddGiftSuccess(message: mes));
    });
  }
}
