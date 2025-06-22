import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/reservabile_spot_model/reservabile_spot_model.dart';

class ReservablespotHomeRepoImpl extends ReservablespotHomeRepo {
  final ApiClass apiClass;

  ReservablespotHomeRepoImpl({required this.apiClass});

  @override
  Future<Either<Failure, String>> AddReservableSpot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/addReservableSpot',
          token: token,
          body: {
            'spot_code': spotcode,
            'management_id': managementid,
            'location_id': locationid
          });
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
  Future<Either<Failure, String>> DeleteReservableSpot(
      {required String token, required String id}) async {
    try {
      var data = await apiClass
          .post(endpoint: 'admin/deleteReservableSpot', token: token, body: {
        'id': id,
      });
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
  Future<Either<Failure, String>> EditReservableSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/editReservableSpot/$id',
          token: token,
          body: {
            'spot_code': spotcode,
            'management_id': managementid,
            'location_id': locationid
          });
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
  Future<Either<Failure, List<ReservableSpotModel>>> GetReservableSpot(
      {required String token}) async {
    try {
      var data = await apiClass.get(
          endpoint: 'admin/getReservableSpots', token: token);
      List<ReservableSpotModel> spot = [];
      for (var item in data['success']) {
        spot.add(ReservableSpotModel.fromJson(item));
      }
      return right(spot);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> addprice(
      {required String token,
      required String pricePerHour,
      required String reservationFees,
      required String timeRestriction}) async {
    try {
      var data = await apiClass
          .post(endpoint: 'admin/managePrices/reservable', token: token, body: {
        'price_per_hour': pricePerHour,
        'reservation_fees': reservationFees,
        'time_restriction': timeRestriction
      });
      String message = data['success'];
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
