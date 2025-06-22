import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/AnimatedPieChartReservableSpots.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_reservable_spot_model/get_popular_reservable_spot_model.dart';
import 'package:parkify_admin/constant.dart';

class Mostusedreservablespots extends StatelessWidget {
  const Mostusedreservablespots({super.key, required this.reservablespot});
  final List<GetPopularReservableSpotModel> reservablespot;
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
              'Most Used Reservable Spots',
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
              child: AnimatedPieChartReservableSpots(
                reservablespot: reservablespot,
              ),
            ),
            PositionedPieChartReservable(
              publicspot: reservablespot,
            ),
          ],
        ),
      ),
    );
  }
}
