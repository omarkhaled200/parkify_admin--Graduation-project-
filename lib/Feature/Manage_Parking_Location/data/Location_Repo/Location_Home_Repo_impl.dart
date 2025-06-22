import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';

class LocationHomeRepoImpl extends LocationHomeRepo {
  final ApiClass apiClass;

  LocationHomeRepoImpl(this.apiClass);

  @override
  Future<Either<Failure, String>> AddLocation(
      {required String token,
      required String name,
      required String address,
      required String gpslocation}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/addLocation',
          token: token,
          body: {
            'name': name,
            'address': address,
            'gps_location': gpslocation
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
  Future<Either<Failure, String>> DeleteLocation(
      {required String token, required String id}) async {
    try {
      var data = await apiClass
          .post(endpoint: 'admin/deleteLocation', token: token, body: {
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
  Future<Either<Failure, String>> EditLocation(
      {required int id,
      required String token,
      required String name,
      required String address,
      required String gpslocation}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/editLocation/$id',
          token: token,
          body: {
            'name': name,
            'address': address,
            'gps_location': gpslocation
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
  Future<Either<Failure, List<LocationModel>>> GetAllLocations(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getAllLocations', token: token);
      List<LocationModel> loc = [];
      for (var item in data['success']) {
        loc.add(LocationModel.fromJson(item));
      }

      return right(loc);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> ChangeLocationStatus(
      {required String token, required int id, required String status}) async {
    try {
      var data = await apiClass.post(
          endpoint: 'admin/changeLocationStatus/$id',
          token: token,
          body: {'status': status});
      String message = data['success'];
      print(">>> Change user Status API response: ${message}");
      return right(message);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
