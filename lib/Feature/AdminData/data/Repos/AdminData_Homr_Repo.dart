import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/AdminData/data/admin_data_model/admin_data_model.dart';
import 'package:parkify_admin/Feature/Auth/data/Model/user_model/user_model.dart';

abstract class AdmindataHomrRepo {
  Future<Either<Failure, List<AdminDataModel>>> getAllAdminData({
    required String token,
  });
}
