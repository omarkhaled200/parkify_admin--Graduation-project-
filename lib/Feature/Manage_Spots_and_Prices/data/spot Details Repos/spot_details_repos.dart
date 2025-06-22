import 'package:dartz/dartz.dart';
import 'package:parkify_admin/Core/errors/failure.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/spotdetialsmodel/spotdetialsmodel.dart';

abstract class SpotDetailsRepos {
  Future<Either<Failure, List<Spotdetialsmodel>>> GetSpotdetials(
      {required String token});
}
