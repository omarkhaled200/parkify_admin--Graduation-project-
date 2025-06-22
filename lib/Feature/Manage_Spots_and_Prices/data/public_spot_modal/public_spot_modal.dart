import 'package:equatable/equatable.dart';

class PublicSpotModal extends Equatable {
  final int? id;
  final String? spotCode;
  final int? managementId;
  final int? locationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const PublicSpotModal({
    this.id,
    this.spotCode,
    this.managementId,
    this.locationId,
    this.createdAt,
    this.updatedAt,
  });

  factory PublicSpotModal.fromJson(Map<String, dynamic> json) {
    return PublicSpotModal(
      id: json['id'] as int?,
      spotCode: json['spot_code'] as String?,
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
      managementId,
      locationId,
      createdAt,
      updatedAt,
    ];
  }
}
