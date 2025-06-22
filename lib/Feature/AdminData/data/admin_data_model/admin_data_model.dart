import 'package:equatable/equatable.dart';

class AdminDataModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? activity;
  final String? role;
  final String? createdAt;
  final DateTime? updatedAt;

  const AdminDataModel({
    this.id,
    this.name,
    this.email,
    this.activity,
    this.role,
    this.createdAt,
    this.updatedAt,
  });

  factory AdminDataModel.fromJson(Map<String, dynamic> json) {
    return AdminDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      activity: json['activity'] as String?,
      role: json['role'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'activity': activity,
        'role': role,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      activity,
      role,
      createdAt,
      updatedAt,
    ];
  }
}
