import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';

// ignore: must_be_immutable
class dropdownlocations extends StatefulWidget {
  dropdownlocations({
    super.key,
    required this.list,
    required this.selectedPlate,
    this.onChanged,
  });

  String selectedPlate;
  final List<String> list;
  final void Function(String?)? onChanged;

  @override
  State<dropdownlocations> createState() => _dropdownlocationsState();
}

class _dropdownlocationsState extends State<dropdownlocations> {
  int status = 1;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedPlate.isNotEmpty
        ? widget.selectedPlate
        : widget.list.isNotEmpty
            ? widget.list.first
            : null;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      borderRadius: BorderRadius.circular(10),
      dropdownColor: Colors.black,
      style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: Assets.textfamily),
      decoration: InputDecoration(
        enabledBorder: customOutlineinputborderdesign(),
        border: customOutlineinputborderdesign(),
        focusedBorder: customOutlineinputborderdesign(),
      ),
      value: selectedValue,
      items: widget.list.map((String value) {
        return DropdownMenuItem(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }

  OutlineInputBorder customOutlineinputborderdesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    );
  }
}
