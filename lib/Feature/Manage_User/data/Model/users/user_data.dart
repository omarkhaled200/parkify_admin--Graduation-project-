import 'package:equatable/equatable.dart';

class UsersData extends Equatable {
  final int? id;
  final String? national;
  final String? phone;
  final dynamic address;
  final int? isActive;
  final double? balance;
  final double? points;

  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const UsersData({
    this.id,
    this.national,
    this.phone,
    this.address,
    this.isActive,
    this.balance,
    this.points,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) => UsersData(
        id: json['id'] as int?,
        national: json['national'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as dynamic,
        isActive: json['is_active'] as int?,
        balance: (json['balance'] as num?)?.toDouble(),
        points: (json['points'] as num?)?.toDouble(),
        userId: json['user_id'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'national': national,
        'phone': phone,
        'address': address,
        'is_active': isActive,
        'balance': balance,
        'points': points,
        'user_id': userId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      national,
      phone,
      address,
      isActive,
      balance,
      points,
      userId,
      createdAt,
      updatedAt,
    ];
  }
}
