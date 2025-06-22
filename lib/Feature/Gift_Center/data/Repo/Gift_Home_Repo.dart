import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/point/Point_Model.dart';

abstract class GiftHomeRepo {
  Future<Either<Failure, List<Gift>>> GetAllGift({required String token});
  Future<Either<Failure, String>> AddGift(
      {required String token,
      required String description,
      required String cost,
      required String discount});
  Future<Either<Failure, String>> EditGift(
      {required int id,
      required String token,
      required String description,
      required String cost,
      required String discount});
  Future<Either<Failure, String>> DeleteGift({
    required String token,
    required String id,
  });

  Future<Either<Failure, pointmodel>> getpointview({required String token});

  Future<Either<Failure, String>> Editpoint(
      {required String token,
      required String publicpointsperhour,
      required String reservablepointsperhour,
      required String percentage});
}
