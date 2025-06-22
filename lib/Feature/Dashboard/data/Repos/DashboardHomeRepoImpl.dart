import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_monthly_profit_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_gift_model/get_popular_gift_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_public_spot_model/get_popular_public_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_reservable_spot_model/get_popular_reservable_spot_model.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_user_account_status.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Repos/DashboardHomeRepo.dart';

class Dashboardhomerepoimpl extends Dashboardhomerepo {
  final ApiClass apiClass;

  Dashboardhomerepoimpl(this.apiClass);

  @override
  Future<Either<Failure, GetMonthlyProfitModel>> getMonthlyProfit(
      {required String token, required int id}) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getMonthlyProfit/$id',
        token: token,
      );
      GetMonthlyProfitModel message =
          GetMonthlyProfitModel.fromJson(data['success']);
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetPopularReservableSpotModel>>>
      getPopluarReservableSpot({required String token, required int id}) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getPopularReservableSpots/$id',
        token: token,
      );
      List<GetPopularReservableSpotModel> message = [];
      for (var item in data['success']) {
        message.add(GetPopularReservableSpotModel.fromJson(item));
      }
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetPopularGiftModel>>> getPopularGift(
      {required String token}) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getPopularGifts',
        token: token,
      );
      List<GetPopularGiftModel> message = [];
      for (var item in data['success']) {
        message.add(GetPopularGiftModel.fromJson(item));
      }
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, List<String>>> getdata({
    required String token,
    required int id,
  }) async {
    try {
      final data1 = await apiClass.get(
        endpoint: 'admin/dashboard/getTotalProfit/$id',
        token: token,
      );
      final data2 = await apiClass.get(
        endpoint: 'admin/dashboard/getTotalUsers',
        token: token,
      );
      final data3 = await apiClass.get(
        endpoint: 'admin/dashboard/getAvailableReservableSpots/$id',
        token: token,
      );
      final data4 = await apiClass.get(
        endpoint: 'admin/dashboard/getAvailablePublicSpots/$id',
        token: token,
      );

      // غير من message لـ success
      final message1 = data1['success']?.toString() ?? '0';
      final message2 = data2['success']?.toString() ?? '0';
      final message3 = data3['success']?.toString() ?? '0';
      final message4 = data4['success']?.toString() ?? '0';

      final List<String> message = [
        message1,
        message2,
        message3,
        message4,
      ];

      print('🎉 Final messages: $message'); // شوف النتيجة النهائية

      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserAccountStatus>> getUseraccountstatus({
    required String token,
  }) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getUserAccountStatus',
        token: token,
      );
      GetUserAccountStatus message =
          GetUserAccountStatus.fromJson(data['success']);

      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getalllocationreport({
    required String token,
    required int id,
  }) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getAllDashboardData/$id',
        token: token,
      );
      String message = data['success'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<GetPopularPublicSpotModel>>> getpopularPublicSpot(
      {required String token, required int id}) async {
    try {
      var data = await apiClass.get(
        endpoint: 'admin/dashboard/getPopularPublicSpots/$id',
        token: token,
      );
      List<GetPopularPublicSpotModel> message = [];
      for (var item in data['success']) {
        message.add(GetPopularPublicSpotModel.fromJson(item));
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
