import 'package:equatable/equatable.dart';

class RecentLog extends Equatable {
  final String? licensePlate;
  final double? invoicePrice;
  final int? isPayed;
  final String? enteredAt;
  final String? exitedAt;
  final String? spot;
  final String? logType;

  const RecentLog({
    this.licensePlate,
    this.invoicePrice,
    this.isPayed,
    this.enteredAt,
    this.exitedAt,
    this.spot,
    this.logType,
  });

  factory RecentLog.fromJson(Map<String, dynamic> json) => RecentLog(
        licensePlate: json['license_plate'] as String?,
        invoicePrice: (json['invoice_price'] as num?)?.toDouble(),
        isPayed: json['is_payed'] as int?,
        enteredAt: json['entered_at'] as String?,
        exitedAt: json['exited_at'] as String?,
        spot: json['spot'] as String?,
        logType: json['log_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'license_plate': licensePlate,
        'invoice_price': invoicePrice,
        'is_payed': isPayed,
        'entered_at': enteredAt,
        'exited_at': exitedAt,
        'spot': spot,
        'log_type': logType,
      };

  @override
  List<Object?> get props {
    return [
      licensePlate,
      invoicePrice,
      isPayed,
      enteredAt,
      exitedAt,
      spot,
      logType,
    ];
  }
}
