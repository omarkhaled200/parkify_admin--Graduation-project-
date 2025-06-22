import 'package:equatable/equatable.dart';

import 'admin.dart';

class AdminModel extends Equatable {
  final String? token;
  final Admin? admin;

  const AdminModel({this.token, this.admin});

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        token: json['token'] as String?,
        admin: json['admin'] == null
            ? null
            : Admin.fromJson(json['admin'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'admin': admin?.toJson(),
      };

  @override
  List<Object?> get props => [token, admin];
}
