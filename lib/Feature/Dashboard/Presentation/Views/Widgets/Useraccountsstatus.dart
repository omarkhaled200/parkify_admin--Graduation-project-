import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/AnimatedPieChartUserAccountstatus.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_user_account_status.dart';
import 'package:parkify_admin/constant.dart';

class Useraccountsstatus extends StatelessWidget {
  const Useraccountsstatus({super.key, required this.status});
  final GetUserAccountStatus status;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    return Card(
      color: kprimaryColor,
      child: Padding(
        padding: const EdgeInsetsGeometry.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            Text(
              'User Accounts Status',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily),
            ),
            SizedBox(
              height: heaight * 0.01,
            ),
            SizedBox(
              height: heaight * 0.4,
              child: AnimatedPieChartUserAccountstatus(
                status: status,
              ),
            ),
            PositionedPieChartUserAccountstatus(
              status: status,
            ),
          ],
        ),
      ),
    );
  }
}
