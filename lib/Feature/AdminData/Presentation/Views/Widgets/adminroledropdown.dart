import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

class Adminroledropdown extends StatefulWidget {
  Adminroledropdown(
      {super.key, required this.list, required this.selectedPlate, this.text});

  String selectedPlate;

  final List<String> list;
  final String? text;
  @override
  State<Adminroledropdown> createState() => _AdminroledropdownState();
}

class _AdminroledropdownState extends State<Adminroledropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(12),
      dropdownColor: Colors.white,
      style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
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
    );
  }

  OutlineInputBorder CustomOutlineinputborderdesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black45, width: 2),
    );
  }
}
