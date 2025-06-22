import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/Cardforparkingpricesandhour.dart';
import 'package:parkify_admin/constant.dart';

class DisplaySpotandpricesDetials extends StatelessWidget {
  const DisplaySpotandpricesDetials({
    super.key,
    required this.height,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.textprice1,
    required this.textprice2,
    required this.texthour,
  });

  final double height;
  final String text1;
  final String text2;
  final String text3;
  final String textprice1;
  final String textprice2;
  final String texthour;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.3,
      decoration: BoxDecoration(
        color: kprimaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Center(
            child: Text(
              'Manage Spot and Prices',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: Assets.textfamily,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.008,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SizedBox(
                  height: height * 0.18,
                  child: Cardforparkingpricesandhour(
                    texttitle: text1,
                    textprice: '$textprice1 \$',
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height * 0.18,
                  child: Cardforparkingpricesandhour(
                    texttitle: text2,
                    textprice: '$textprice2 \$',
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: height * 0.18,
                  child: Cardforparkingpricesandhour(
                    texttitle: text3,
                    textprice: '$texthour minutes',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.009,
          ),
          Center(
            child: Text(
              'R Fees: Reservation per Time Restiction',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black.withOpacity(0.5),
                fontFamily: Assets.textfamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
