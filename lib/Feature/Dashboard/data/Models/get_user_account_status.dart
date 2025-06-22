import 'package:equatable/equatable.dart';

class GetUserAccountStatus extends Equatable {
  final int? active;
  final int? inactive;

  const GetUserAccountStatus({this.active, this.inactive});

  factory GetUserAccountStatus.fromJson(Map<String, dynamic> json) {
    return GetUserAccountStatus(
      active: json['active'] as int?,
      inactive: json['inactive'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'active': active,
        'inactive': inactive,
      };

  @override
  List<Object?> get props => [active, inactive];
}
