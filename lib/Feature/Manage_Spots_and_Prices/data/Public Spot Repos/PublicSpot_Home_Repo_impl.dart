import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/public_spot_modal/public_spot_modal.dart';

class PublicspotHomeRepoImpl extends PublicspotHomeRepo {
  final ApiClass apiClass;

  PublicspotHomeRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, String>> AddPublicSpot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/addPublicSpot',
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
  Future<Either<Failure, String>> DeletePublicSpot(
      {required String token, required String id}) async {
    try {
      var data = await apiClass
          .post(endpoint: 'admin/deletePublicSpot', token: token, body: {
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
  Future<Either<Failure, String>> EditPublicSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/editPublicSpot/$id',
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
  Future<Either<Failure, List<PublicSpotModal>>> GetPublicSpot(
      {required String token}) async {
    try {
      var data =
          await apiClass.get(endpoint: 'admin/getPublicSpots', token: token);
      List<PublicSpotModal> spot = [];
      for (var item in data['success']) {
        spot.add(PublicSpotModal.fromJson(item));
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
      required String additionalGuestFees}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/managePrices/public',
          token: token,
          body: {
            'price_per_hour': pricePerHour,
            'additional_guest_fees': additionalGuestFees
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
