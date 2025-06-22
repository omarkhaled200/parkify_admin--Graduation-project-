import 'package:equatable/equatable.dart';

class GetPopularPublicSpotModel extends Equatable {
  final String? spotCode;
  final double? percentage;

  const GetPopularPublicSpotModel({this.spotCode, this.percentage});

  factory GetPopularPublicSpotModel.fromJson(Map<String, dynamic> json) {
    return GetPopularPublicSpotModel(
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
