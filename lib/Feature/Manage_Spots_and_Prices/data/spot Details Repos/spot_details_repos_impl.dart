import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spot%20Details%20Repos/spot_details_repos.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spotdetialsmodel/spotdetialsmodel.dart';

class SpotDetailsReposImpl extends SpotDetailsRepos {
  final ApiClass apiClass;

  SpotDetailsReposImpl(this.apiClass);
  @override
  Future<Either<Failure, List<Spotdetialsmodel>>> GetSpotdetials(
      {required String token}) async {
    try {
      var data = await apiClass.get(endpoint: 'getSpotDetails', token: token);
      List<Spotdetialsmodel> spot = [];
      for (var item in data['success']) {
        spot.add(Spotdetialsmodel.fromJson(item));
      }
      return right(spot);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
