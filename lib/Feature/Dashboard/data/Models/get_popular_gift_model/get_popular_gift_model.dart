import 'package:equatable/equatable.dart';

class GetPopularGiftModel extends Equatable {
  final int? cost;
  final int? discount;
  final String? description;
  final int? usageCount;

  const GetPopularGiftModel({
    this.cost,
    this.discount,
    this.description,
    this.usageCount,
  });

  factory GetPopularGiftModel.fromJson(Map<String, dynamic> json) {
    return GetPopularGiftModel(
      cost: json['cost'] as int?,
      discount: json['discount'] as int?,
      description: json['description'] as String?,
      usageCount: json['usage_count'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'cost': cost,
        'discount': discount,
        'description': description,
        'usage_count': usageCount,
      };

  @override
  List<Object?> get props => [cost, discount, description, usageCount];
}
