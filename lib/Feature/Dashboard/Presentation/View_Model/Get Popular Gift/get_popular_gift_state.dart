part of 'get_popular_gift_cubit.dart';

@immutable
sealed class GetPopularGiftState {}

final class GetPopularGiftInitial extends GetPopularGiftState {}

final class GetPopularGiftLoading extends GetPopularGiftState {}

final class GetPopularGiftFailure extends GetPopularGiftState {
  final String errmessage;

  GetPopularGiftFailure({required this.errmessage});
}

final class GetPopularGiftSuccess extends GetPopularGiftState {
  final List<GetPopularGiftModel> gift;

  GetPopularGiftSuccess({required this.gift});
}
