import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/Widgets/Editanddeleteiconbutton.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';
import 'package:parkify_admin/constant.dart';

class ItemPointGift extends StatelessWidget {
  const ItemPointGift({
    super.key,
    required this.gift,
    required this.token,
  });
  final Gift gift;
  final String token;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        elevation: 4,
        color: kprimaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description: ${gift.description}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Text(
                'Discount : ${gift.discountPercentage}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Text(
                'Cost: ${gift.cost}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Editanddeleteiconbutton(
                token: token,
                width: width,
                gift: gift,
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
