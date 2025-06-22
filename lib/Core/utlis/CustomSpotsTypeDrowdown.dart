import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class Customdspotstyperowdown extends StatefulWidget {
  Customdspotstyperowdown(
      {super.key, required this.list, required this.selectedPlate, this.text});

  String selectedPlate;

  final List<String> list;
  final String? text;
  @override
  State<Customdspotstyperowdown> createState() =>
      _CustomdspotstyperowdownState();
}

class _CustomdspotstyperowdownState extends State<Customdspotstyperowdown> {
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: true,
      child: DropdownButtonFormField<String>(
        dropdownColor: Colors.black,
        style: TextStyle(
            color: Colors.white60,
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: Assets.textfamily),
        decoration: InputDecoration(
          enabledBorder: CustomOutlineinputborderdesign(),
          border: CustomOutlineinputborderdesign(),
          focusedBorder: CustomOutlineinputborderdesign(),
        ),
        value: widget.selectedPlate,
        items: widget.list.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newvalue) {
          setState(() {
            widget.selectedPlate = newvalue!;
          });
        },
      ),
    );
  }

  OutlineInputBorder CustomOutlineinputborderdesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    );
  }
}
