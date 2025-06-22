import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/CustomAmountRickText.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/recent_log.dart';

import 'package:parkify_admin/constant.dart';

class HistoryListViewItem extends StatelessWidget {
  const HistoryListViewItem({
    super.key,
    required this.item,
  });

  final RecentLog item;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Card(
      color: kprimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.spot ?? "No Spot",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  item.licensePlate ?? "Unknown Plate",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            const Divider(color: Color(0xffD8DBDC)),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAmountRickText(item: item),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Arrival: ${item.enteredAt ?? 'N/A'}",
                      style: TextStyle(
                        color: const Color(0xffA0A0A0),
                        fontFamily: Assets.textfamily,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "Exit: ${item.exitedAt ?? 'N/A'}",
                      style: TextStyle(
                        color: const Color(0xffA0A0A0),
                        fontFamily: Assets.textfamily,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
