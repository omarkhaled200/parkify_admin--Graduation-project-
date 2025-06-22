part of 'get_all_gift_cubit.dart';

@immutable
sealed class GetAllGiftState {}

final class GetAllGiftInitial extends GetAllGiftState {}

final class GetAllGiftLoading extends GetAllGiftState {}

final class GetAllGiftFailure extends GetAllGiftState {
  final String errmessage;

  GetAllGiftFailure({required this.errmessage});
}

final class GetAllGiftSuccess extends GetAllGiftState {
  final List<Gift> gift;

  GetAllGiftSuccess({required this.gift});
}
