import 'package:flutter/material.dart';
import 'package:parkify_admin/constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    return Divider(
      color: kprimaryColor,
      thickness: 4,
      height: heaight * 0.04,
    );
  }
}
