import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class DataDetailsRowforuser extends StatelessWidget {
  const DataDetailsRowforuser({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text1,
              style: TextStyle(
                fontFamily: Assets.textfamily,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
            ),
          ),
        ),
        Container(
          height: heaight * 0.037,
          width: 4,
          color: const Color(0xffA9D6E5),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              text2,
              style: TextStyle(
                fontFamily: Assets.textfamily,
                fontWeight: FontWeight.bold,
                fontSize: 19,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
