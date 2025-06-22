import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/public_spot_modal/public_spot_modal.dart';

abstract class PublicspotHomeRepo {
  Future<Either<Failure, List<PublicSpotModal>>> GetPublicSpot(
      {required String token});
  Future<Either<Failure, String>> AddPublicSpot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid});
  Future<Either<Failure, String>> EditPublicSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid});
  Future<Either<Failure, String>> DeletePublicSpot({
    required String token,
    required String id,
  });
  Future<Either<Failure, String>> addprice({
    required String token,
    required String pricePerHour,
    required String additionalGuestFees,
  });
}
