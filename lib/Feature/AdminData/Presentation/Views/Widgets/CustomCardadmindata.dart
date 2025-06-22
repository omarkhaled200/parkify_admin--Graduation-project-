import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class CustomCardadmindata extends StatelessWidget {
  const CustomCardadmindata(
      {super.key,
      required this.icon,
      required this.iconcolor,
      required this.text1,
      required this.text2});
  final IconData icon;
  final Color iconcolor;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            width: 1,
            color: Colors.grey.shade300,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
        child: Column(
          children: [
            Icon(
              icon,
              color: iconcolor,
              size: 30,
            ),
            SizedBox(
              height: height * 0.007,
            ),
            Text(
              text1,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: Assets.textfamily,
              ),
            ),
            SizedBox(
              height: height * 0.007,
            ),
            Text(
              text2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500,
                fontFamily: Assets.textfamily,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
