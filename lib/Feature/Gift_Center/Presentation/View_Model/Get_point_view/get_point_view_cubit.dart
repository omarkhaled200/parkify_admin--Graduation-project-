import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/point/Point_Model.dart';

part 'get_point_view_state.dart';

class GetPointViewCubit extends Cubit<GetPointViewState> {
  GetPointViewCubit(this.homeRepo) : super(GetPointViewInitial());
  final GiftHomeRepo homeRepo;
  Future<void> getpointview({required String token}) async {
    emit(GetPointViewLoading());
    var result = await homeRepo.getpointview(token: token);
    result.fold((Failure) {
      emit(GetPointViewFailure(errmessage: Failure.errmessage));
    }, (point) {
      emit(GetPointViewSuccess(points: point));
    });
  }
}
