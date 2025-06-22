import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/point/Point_Model.dart';

class GiftHomeRepoImpl extends GiftHomeRepo {
  final ApiClass apiClass;

  GiftHomeRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, String>> AddGift(
      {required String token,
      required String description,
      required String cost,
      required String discount}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/addGift',
          token: token,
          body: {
            'description': description,
            'cost': cost,
            'discount': discount
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
  Future<Either<Failure, String>> DeleteGift({
    required String token,
    required String id,
  }) async {
    try {
      var data = await apiClass
          .post(endpoint: 'admin/deleteGift', token: token, body: {
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
  Future<Either<Failure, String>> EditGift(
      {required int id,
      required String token,
      required String description,
      required String cost,
      required String discount}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/editGift/$id',
          token: token,
          body: {
            'description': description,
            'cost': cost,
            'discount': discount
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
  Future<Either<Failure, List<Gift>>> GetAllGift(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getAllGifts', token: token);
      List<Gift> gift = [];
      for (var item in data['success']) {
        gift.add(Gift.fromJson(item));
      }
      print('the gift is $gift');
      return right(gift);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, pointmodel>> getpointview(
      {required String token}) async {
    try {
      var point =
          await apiClass.get(endpoint: 'getPointsPerHour', token: token);
      var refund = await apiClass.get(
          endpoint: 'admin/getRefundPercentage', token: token);
      final detials = pointmodel.fromJson(point, refund);

      return right(detials);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> Editpoint(
      {required String token,
      required String publicpointsperhour,
      required String reservablepointsperhour,
      required String percentage}) async {
    try {
      var pointsResponse = await apiClass
          .post(endpoint: 'admin/editPointsPerHour', token: token, body: {
        'public_points_per_hour': publicpointsperhour,
        'reservable_points_per_hour': reservablepointsperhour
      });
      var percentageResponse = await apiClass.post(
          endpoint: 'admin/editRefundPercentage',
          token: token,
          body: {'percentage': percentage});

      final message =
          'Points updated: $pointsResponse, Percentage updated: $percentageResponse';
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
