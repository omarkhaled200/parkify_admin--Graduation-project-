import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/reservabile_spot_model/reservabile_spot_model.dart';

abstract class ReservablespotHomeRepo {
  Future<Either<Failure, List<ReservableSpotModel>>> GetReservableSpot(
      {required String token});
  Future<Either<Failure, String>> AddReservableSpot(
      {required String token,
      required String spotcode,
      required String managementid,
      required String locationid});
  Future<Either<Failure, String>> EditReservableSpot(
      {required int id,
      required String token,
      required String spotcode,
      required String managementid,
      required String locationid});
  Future<Either<Failure, String>> DeleteReservableSpot({
    required String token,
    required String id,
  });
  Future<Either<Failure, String>> addprice({
    required String token,
    required String pricePerHour,
    required String reservationFees,
    required String timeRestriction,
  });
}
