import 'package:equatable/equatable.dart';

class LocationModel extends Equatable {
  final int? id;
  final String? name;
  final String? address;
  final String? gpsLocation;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LocationModel({
    this.id,
    this.name,
    this.address,
    this.gpsLocation,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        address: json['address'] as String?,
        gpsLocation: json['gps_location'] as String?,
        isActive: json['is_active'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'gps_location': gpsLocation,
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      address,
      gpsLocation,
      isActive,
      createdAt,
      updatedAt,
    ];
  }
}
