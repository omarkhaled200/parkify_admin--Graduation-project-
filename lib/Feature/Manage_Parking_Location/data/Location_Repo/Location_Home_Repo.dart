import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';

abstract class LocationHomeRepo {
  Future<Either<Failure, List<LocationModel>>> GetAllLocations(
      {required String token});
  Future<Either<Failure, String>> AddLocation({
    required String token,
    required String name,
    required String address,
    required String gpslocation,
  });
  Future<Either<Failure, String>> EditLocation({
    required int id,
    required String token,
    required String name,
    required String address,
    required String gpslocation,
  });
  Future<Either<Failure, String>> DeleteLocation({
    required String token,
    required String id,
  });
  Future<Either<Failure, String>> ChangeLocationStatus({
    required String token,
    required int id,
    required String status,
  });
}
