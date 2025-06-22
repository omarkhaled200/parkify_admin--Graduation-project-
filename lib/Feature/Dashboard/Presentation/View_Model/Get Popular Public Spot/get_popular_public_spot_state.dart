part of 'get_popular_public_spot_cubit.dart';

@immutable
sealed class GetPopularPublicSpotState {}

final class GetPopularPublicSpotInitial extends GetPopularPublicSpotState {}

final class GetPopularPublicSpotLoading extends GetPopularPublicSpotState {}

final class GetPopularPublicSpotFailure extends GetPopularPublicSpotState {
  final String errmessage;

  GetPopularPublicSpotFailure({required this.errmessage});
}

final class GetPopularPublicSpotSuccess extends GetPopularPublicSpotState {
  final List<GetPopularPublicSpotModel> public;

  GetPopularPublicSpotSuccess({required this.public});
}
