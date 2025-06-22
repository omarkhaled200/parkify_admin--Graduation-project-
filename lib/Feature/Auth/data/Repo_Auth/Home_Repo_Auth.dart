import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Auth/data/Model/user_model/user_model.dart';

abstract class HomeRepoAuth {
  Future<Either<Failure, AdminModel>> postLogin(
      {required String email, required String password});

  Future<Either<Failure, AdminModel>> postRegister(
      {required String Name,
      required String Email,
      required String password,
      required String ConfirmPassword});

  Future<Either<Failure, String>> postlogout();
}
