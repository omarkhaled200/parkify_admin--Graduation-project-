import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_monthly_profit_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_gift_model/get_popular_gift_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_public_spot_model/get_popular_public_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_reservable_spot_model/get_popular_reservable_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_user_account_status.dart';

abstract class Dashboardhomerepo {
  Future<Either<Failure, List<String>>> getdata(
      {required String token, required int id});
  Future<Either<Failure, List<GetPopularReservableSpotModel>>>
      getPopluarReservableSpot({required String token, required int id});

  Future<Either<Failure, List<GetPopularPublicSpotModel>>> getpopularPublicSpot(
      {required String token, required int id});

  Future<Either<Failure, GetMonthlyProfitModel>> getMonthlyProfit(
      {required String token, required int id});

  Future<Either<Failure, GetUserAccountStatus>> getUseraccountstatus(
      {required String token});

  Future<Either<Failure, List<GetPopularGiftModel>>> getPopularGift(
      {required String token});

  Future<Either<Failure, String>> getalllocationreport({
    required String token,
    required int id,
  });
}
