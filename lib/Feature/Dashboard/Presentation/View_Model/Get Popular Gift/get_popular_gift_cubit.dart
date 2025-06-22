import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_gift_model/get_popular_gift_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

part 'get_popular_gift_state.dart';

class GetPopularGiftCubit extends Cubit<GetPopularGiftState> {
  GetPopularGiftCubit(this.homeRepo) : super(GetPopularGiftInitial());
  final Dashboardhomerepo homeRepo;
  Future<void> GetPopularGift({
    required String token,
  }) async {
    emit(GetPopularGiftLoading());
    var result = await homeRepo.getPopularGift(token: token);
    result.fold((Failure) {
      emit(GetPopularGiftFailure(errmessage: Failure.errmessage));
    }, (mes) {
      emit(GetPopularGiftSuccess(gift: mes));
    });
  }
}
