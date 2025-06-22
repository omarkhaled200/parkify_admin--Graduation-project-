part of 'get_all_locations_cubit.dart';

@immutable
sealed class GetAllLocationsState {}

final class GetAllLocationsInitial extends GetAllLocationsState {}

final class GetAllLocationsLoading extends GetAllLocationsState {}

final class GetAllLocationsFailure extends GetAllLocationsState {
  final String errmessage;

  GetAllLocationsFailure({required this.errmessage});
}

final class GetAllLocationsSuccess extends GetAllLocationsState {
  final List<LocationModel> location;

  GetAllLocationsSuccess({required this.location});
}
