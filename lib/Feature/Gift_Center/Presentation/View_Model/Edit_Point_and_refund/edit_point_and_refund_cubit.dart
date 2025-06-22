import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';

part 'edit_point_and_refund_state.dart';

class EditPointAndRefundCubit extends Cubit<EditPointAndRefundState> {
  EditPointAndRefundCubit(this.homeRepo) : super(EditPointAndRefundInitial());
  final GiftHomeRepo homeRepo;
  Future<void> editpointandrefund(
      {required String token,
      required String publicpointsperhour,
      required String reservablepointsperhour,
      required String percentage}) async {
    emit(EditPointAndRefundLoading());
    var result = await homeRepo.Editpoint(
        token: token,
        publicpointsperhour: publicpointsperhour,
        reservablepointsperhour: reservablepointsperhour,
        percentage: percentage);
    result.fold((Failure) {
      emit(EditPointAndRefundFailure(errmessage: Failure.errmessage));
    }, (msg) {
      emit(EditPointAndRefundSuccess(message: msg));
    });
  }
}
