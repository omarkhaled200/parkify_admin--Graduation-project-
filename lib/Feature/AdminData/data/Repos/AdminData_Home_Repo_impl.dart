import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/AdminData/data/Repos/AdminData_Homr_Repo.dart';
import 'package:parkify_admin/Feature/AdminData/data/admin_data_model/admin_data_model.dart';

class AdmindataHomeRepoImpl extends AdmindataHomrRepo {
  final ApiClass apiClass;

  AdmindataHomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, List<AdminDataModel>>> getAllAdminData(
      {required String token}) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/getActivityLog',
        token: token,
      );
      List<AdminDataModel> message = [];
      for (var item in data['success']) {
        message.add(AdminDataModel.fromJson(item));
      }
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
