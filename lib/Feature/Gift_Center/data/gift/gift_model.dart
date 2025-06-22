import 'package:equatable/equatable.dart';

class Gift extends Equatable {
  final int? id;
  final String? description;
  final int? discountPercentage;
  final int? cost;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Gift({
    this.id,
    this.description,
    this.discountPercentage,
    this.cost,
    this.createdAt,
    this.updatedAt,
  });

  factory Gift.fromJson(Map<String, dynamic> json) => Gift(
        id: json['id'] as int?,
        description: json['description'] as String?,
        discountPercentage: json['discount_percentage'] as int?,
        cost: json['cost'] as int?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'discount_percentage': discountPercentage,
        'cost': cost,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      description,
      discountPercentage,
      cost,
      createdAt,
      updatedAt,
    ];
  }
}
