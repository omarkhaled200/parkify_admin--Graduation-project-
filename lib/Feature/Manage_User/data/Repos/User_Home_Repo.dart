import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/user_logs_model.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/users/users.dart';

abstract class UserHomeRepo {
  Future<Either<Failure, String>> ChangeUserStatus({
    required String token,
    required int id,
    required String status,
  });

  Future<Either<Failure, List<Users>>> GetAllUser({
    required String token,
  });
  Future<Either<Failure, UserLogsModel>> GetUserLogs({
    required int id,
    required String token,
  });
}
