import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/Token_Functions.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Auth/data/Model/user_model/user_model.dart';
import 'package:parkify_admin/Feature/Auth/data/Repo_Auth/Home_Repo_Auth.dart';

class HomeRepoImpl extends HomeRepoAuth {
  final ApiClass apiClass;
  HomeRepoImpl(this.apiClass);
  @override
  Future<Either<Failure, AdminModel>> postLogin(
      {required String email, required String password}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/login',
          body: {'email': email, 'password': password});

      // تحقق إذا كانت البيانات ليست null وأيضاً من نوع Map<String, dynamic>
      if (data != null && data is Map<String, dynamic>) {
        if (data.containsKey('token') && data.containsKey('admin')) {
          String token = data['token'];
          await saveToken(token);
          AdminModel admin = AdminModel.fromJson(data);
          print('the admin response is $admin');
          return right(admin);
        } else {
          return left(ServerFailure('Missing token or user data in response'));
        }
      } else {
        return left(ServerFailure('Invalid response from server or null data'));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AdminModel>> postRegister(
      {required String Name,
      required String Email,
      required String password,
      required String ConfirmPassword}) async {
    try {
      var data = await apiClass.post(endpoint: 'admin/register', body: {
        'name': Name,
        'email': Email,
        'password': password,
        'password_confirmation': ConfirmPassword
      });
      AdminModel? user;
      try {
        user = AdminModel.fromJson(data);
        print(user);
      } catch (e) {
        print("Error parsing JSON: $e");
      }
      return right(user!);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> postlogout() async {
    try {
      var response = await apiClass.post(
        endpoint: 'admin/logout',
        body: {}, // أو ابعته null لو مش محتاج body أصلا
      );

      // ناخد الماسدج من الريسبونس
      String message = response['message'];

      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
