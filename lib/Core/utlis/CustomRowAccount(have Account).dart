import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class CustomRowAccount extends StatelessWidget {
  const CustomRowAccount(
      {super.key, required this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have Account?",
            style: TextStyle(
                fontFamily: Assets.textfamily,
                fontSize: 18,
                color: Colors.black)),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: const Color(0XFF70A2B3),
              fontFamily: Assets.textfamily,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
