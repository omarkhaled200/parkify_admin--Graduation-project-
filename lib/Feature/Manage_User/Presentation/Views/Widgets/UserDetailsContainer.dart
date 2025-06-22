import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/CustomDivider.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/DataDetailsRowforuser.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/user_logs_model.dart';
import 'package:parkify_admin/constant.dart';

class UserDetailsContainer extends StatelessWidget {
  const UserDetailsContainer({
    super.key,
    required this.heaight,
    required this.logs,
  });

  final double heaight;
  final UserLogsModel logs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heaight * 0.6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: kprimaryColor,
            width: 6,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            DataDetailsRowforuser(
              text1: 'Full Name',
              text2: '${logs.name}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'National ID',
              text2: '${logs.userData!.national}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'Email',
              text2: '${logs.email}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'Phone',
              text2: '${logs.userData!.phone}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'Address',
              text2: '${logs.userData!.address}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'Balance',
              text2: '${logs.userData!.balance}',
            ),
            const CustomDivider(),
            DataDetailsRowforuser(
              text1: 'Gift Points',
              text2: '${logs.userData!.points}',
            ),
          ],
        ),
      ),
    );
  }
}
