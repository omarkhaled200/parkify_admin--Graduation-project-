import 'package:equatable/equatable.dart';

class ReservableSpotModel extends Equatable {
  final int? id;
  final String? spotCode;
  final int? isOccupied;
  final int? managementId;
  final int? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ReservableSpotModel({
    this.id,
    this.spotCode,
    this.isOccupied,
    this.managementId,
    this.locationId,
    this.createdAt,
    this.updatedAt,
  });

  factory ReservableSpotModel.fromJson(Map<String, dynamic> json) {
    return ReservableSpotModel(
      id: json['id'] as int?,
      spotCode: json['spot_code'] as String?,
      isOccupied: json['is_occupied'] as int?,
      managementId: json['management_id'] as int?,
      locationId: json['location_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'spot_code': spotCode,
        'is_occupied': isOccupied,
        'management_id': managementId,
        'location_id': locationId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      spotCode,
      isOccupied,
      managementId,
      locationId,
      createdAt,
      updatedAt,
    ];
  }
}
