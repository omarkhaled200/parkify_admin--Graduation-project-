import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final int? userId;
  final String? national;
  final String? phone;
  final dynamic address;
  final int? isActive;
  final double? balance;
  final double? points;

  const UserData({
    this.userId,
    this.national,
    this.phone,
    this.address,
    this.isActive,
    this.balance,
    this.points,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json['user_id'] as int?,
        national: json['national'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as dynamic,
        isActive: json['is_active'] as int?,
        balance: (json['balance'] as num?)?.toDouble(),
        points: (json['points'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'national': national,
        'phone': phone,
        'address': address,
        'is_active': isActive,
        'balance': balance,
        'points': points,
      };

  @override
  List<Object?> get props {
    return [
      userId,
      national,
      phone,
      address,
      isActive,
      balance,
      points,
    ];
  }
}
