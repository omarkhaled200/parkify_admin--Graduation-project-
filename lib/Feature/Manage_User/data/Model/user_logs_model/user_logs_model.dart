import 'package:equatable/equatable.dart';

import 'recent_log.dart';
import 'user_data.dart';

class UserLogsModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final UserData? userData;
  final List<RecentLog>? recentLogs;

  const UserLogsModel({
    this.id,
    this.name,
    this.email,
    this.userData,
    this.recentLogs,
  });

  factory UserLogsModel.fromJson(Map<String, dynamic> json) => UserLogsModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        userData: json['user_data'] == null
            ? null
            : UserData.fromJson(json['user_data'] as Map<String, dynamic>),
        recentLogs: (json['recent_logs'] as List<dynamic>?)
            ?.map((e) => RecentLog.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'user_data': userData?.toJson(),
        'recent_logs': recentLogs?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, email, userData, recentLogs];
}
