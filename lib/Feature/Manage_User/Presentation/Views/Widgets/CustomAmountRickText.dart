import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/user_logs_model/recent_log.dart';

class CustomAmountRickText extends StatelessWidget {
  const CustomAmountRickText({
    super.key,
    required this.item,
  });

  final RecentLog item;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "AMOUNT: ", // First part (bold)
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black, // Default text color
          fontFamily: Assets.textfamily,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: item.invoicePrice!.toString(), // Second part (green color)
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: Assets.textfamily,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
