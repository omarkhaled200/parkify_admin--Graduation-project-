import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/StatItem.dart';

import 'package:parkify_admin/constant.dart';

class customCardDetialsStatistics extends StatelessWidget {
  const customCardDetialsStatistics({
    super.key,
    required this.stat,
    required this.value,
  });

  final StatItem stat;
  final String value;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: kprimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${stat.title}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.w500,
                      fontFamily: Assets.textfamily),
                ),
                Icon(
                  size: 26,
                  stat.icon,
                  color: Colors.black45,
                ),
              ],
            ),
            SizedBox(
              height: heaight * 0.009,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${value}',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.textfamily)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
