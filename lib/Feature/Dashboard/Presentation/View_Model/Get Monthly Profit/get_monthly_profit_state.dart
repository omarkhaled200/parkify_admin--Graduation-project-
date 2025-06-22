part of 'get_monthly_profit_cubit.dart';

@immutable
sealed class GetMonthlyProfitState {}

final class GetMonthlyProfitInitial extends GetMonthlyProfitState {}

final class GetMonthlyProfitLoading extends GetMonthlyProfitState {}

final class GetMonthlyProfitFailure extends GetMonthlyProfitState {
  final String errmessage;

  GetMonthlyProfitFailure({required this.errmessage});
}

final class GetMonthlyProfitSuccess extends GetMonthlyProfitState {
  final GetMonthlyProfitModel profit;

  GetMonthlyProfitSuccess({required this.profit});
}
