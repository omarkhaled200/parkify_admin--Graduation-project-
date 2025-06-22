import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.obscureText = false,
      this.suffixIcon,
      this.hintcolor,
      this.textcolor,
      this.valdiate,
      this.onpressed,
      this.typekeyboard,
      this.onchanged});
  final TextInputType? typekeyboard;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final Color? hintcolor;
  final Color? textcolor;
  final void Function(String)? onchanged;
  final String? Function(String?)? valdiate;
  final void Function()? onpressed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool isObscure; // متغير داخلي عشان نتحكم في الظهور والاخفاء

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText; // أول قيمة من اللي جاية من فوق
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.typekeyboard,
      validator: widget.valdiate,
      onChanged: widget.onchanged,
      cursorColor: const Color(0xffA0A0A0),
      style: TextStyle(
        color: widget.textcolor,
        fontFamily: Assets.textfamily,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      obscureText: isObscure,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red[900],
          fontFamily: Assets.textfamily,
        ),
        errorMaxLines: 8,
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: Colors.grey,
                size: 24,
              )
            : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  widget.suffixIcon,
                  size: 24,
                ),
                color: Colors.grey,
              )
            : null,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: widget.hintcolor,
          fontFamily: Assets.textfamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineinputBorder(),
        border: OutlineinputBorder(),
        focusedBorder: OutlineinputBorder(),
      ),
    );
  }

  OutlineInputBorder OutlineinputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xffA0A0A0), width: 2),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
