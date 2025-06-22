import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/AnimatedLineChart.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_monthly_profit_model.dart';
import 'package:parkify_admin/constant.dart';

class MonthlyProfit extends StatelessWidget {
  const MonthlyProfit({super.key, required this.profit});
  final GetMonthlyProfitModel profit;
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
              'Monthly Profit',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily),
            ),
            SizedBox(
              height: heaight * 0.02,
            ),
            SizedBox(
              height: heaight * 0.5,
              child: LineChartForSales(
                profit: profit,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
