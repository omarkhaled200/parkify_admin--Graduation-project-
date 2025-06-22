import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class EditandDeleteButton extends StatelessWidget {
  const EditandDeleteButton({
    super.key,
    required this.width,
    required this.heaight,
    this.onPressed,
    required this.text,
    this.backcolor = Colors.black,
  });

  final double width;
  final double heaight;
  final void Function()? onPressed;
  final String text;
  final Color? backcolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width * 0.5, heaight * 0.1),
        backgroundColor: backcolor,
        splashFactory: InkRipple.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: Assets.textfamily,
        ),
      ),
    );
  }
}
