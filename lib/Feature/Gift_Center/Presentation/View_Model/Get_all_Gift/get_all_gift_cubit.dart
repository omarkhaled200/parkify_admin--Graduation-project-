import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';

part 'get_all_gift_state.dart';

class GetAllGiftCubit extends Cubit<GetAllGiftState> {
  GetAllGiftCubit(this.homeRepo) : super(GetAllGiftInitial());
  final GiftHomeRepo homeRepo;
  Future<void> getAllGift({required String token}) async {
    if (isClosed) return;
    emit(GetAllGiftLoading());

    var result = await homeRepo.GetAllGift(token: token);

    result.fold((failure) {
      if (!isClosed) {
        emit(GetAllGiftFailure(errmessage: failure.errmessage));
      }
    }, (gift) {
      if (!isClosed) {
        emit(GetAllGiftSuccess(gift: gift));
      }
    });
  }
}
