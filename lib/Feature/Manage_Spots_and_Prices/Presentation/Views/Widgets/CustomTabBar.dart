import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF4F0EF),
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: Assets.textfamily,
        ),
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 4.0, color: Colors.black),
          insets: EdgeInsets.symmetric(horizontal: 8.0),
        ),
        tabs: [
          Tab(
            text: text1,
          ),
          Tab(text: text2),
        ],
      ),
    );
  }
}
