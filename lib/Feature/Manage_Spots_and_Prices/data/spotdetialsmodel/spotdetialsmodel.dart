import 'package:equatable/equatable.dart';

class Spotdetialsmodel extends Equatable {
  final int? id;
  final String? type;
  final int? pricePerHour;
  final int? additionalGuestFees;
  final int? reservationFees;
  final int? timeRestriction;
  final int? pointsPerHour;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Spotdetialsmodel({
    this.id,
    this.type,
    this.pricePerHour,
    this.additionalGuestFees,
    this.reservationFees,
    this.timeRestriction,
    this.pointsPerHour,
    this.createdAt,
    this.updatedAt,
  });

  factory Spotdetialsmodel.fromJson(Map<String, dynamic> json) {
    return Spotdetialsmodel(
      id: json['id'] as int?,
      type: json['type'] as String?,
      pricePerHour: json['price_per_hour'] as int?,
      additionalGuestFees: json['additional_guest_fees'] as int?,
      reservationFees: json['reservation_fees'] as int?,
      timeRestriction: json['time_restriction'] as int?,
      pointsPerHour: json['points_per_hour'] as int?,
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
        'type': type,
        'price_per_hour': pricePerHour,
        'additional_guest_fees': additionalGuestFees,
        'reservation_fees': reservationFees,
        'time_restriction': timeRestriction,
        'points_per_hour': pointsPerHour,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      type,
      pricePerHour,
      additionalGuestFees,
      reservationFees,
      timeRestriction,
      pointsPerHour,
      createdAt,
      updatedAt,
    ];
  }
}
