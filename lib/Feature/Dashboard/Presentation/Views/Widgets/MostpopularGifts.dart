import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/Most%20Popular%20Gifts.dart';
import 'package:parkify_admin/Feature/Dashboard/data/Models/get_popular_gift_model/get_popular_gift_model.dart';
import 'package:parkify_admin/constant.dart';

class MostpopularGifts extends StatelessWidget {
  const MostpopularGifts({super.key, required this.gift});

  final List<GetPopularGiftModel> gift;
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
              'Most Popular Gifts',
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
              child: SimpleBarChart(
                gift: gift,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
