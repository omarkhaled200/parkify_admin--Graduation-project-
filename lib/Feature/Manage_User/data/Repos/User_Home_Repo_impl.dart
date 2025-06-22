import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/user_logs_model.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/users/users.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo.dart';

class UserHomeRepoImpl extends UserHomeRepo {
  final ApiClass apiClass;

  UserHomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, String>> ChangeUserStatus({
    required String token,
    required int id,
    required String status,
  }) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/changeUserStatus/$id',
          token: token,
          body: {'status': status});
      String message = data['success'];
      print(">>> Change user Status API response: ${message}");
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Users>>> GetAllUser(
      {required String token}) async {
    try {
      var data =
          await apiClass.get(endpoint: 'admin/getAllUsers', token: token);
      List<Users> users = [];
      for (var item in data['success']) {
        users.add(Users.fromJson(item));
      }
      return right(users);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserLogsModel>> GetUserLogs(
      {required int id, required String token}) async {
    try {
      var data =
          await apiClass.get(endpoint: 'getUserWithLogs/$id', token: token);
      UserLogsModel logs = UserLogsModel.fromJson(data['success']);

      return right(logs);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
