import 'package:equatable/equatable.dart';

class GetPopularReservableSpotModel extends Equatable {
  final String? spotCode;
  final double? percentage;

  const GetPopularReservableSpotModel({this.spotCode, this.percentage});

  factory GetPopularReservableSpotModel.fromJson(Map<String, dynamic> json) {
    return GetPopularReservableSpotModel(
      spotCode: json['spot_code'] as String?,
      percentage: (json['percentage'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'spot_code': spotCode,
        'percentage': percentage,
      };

  @override
  List<Object?> get props => [spotCode, percentage];
}
