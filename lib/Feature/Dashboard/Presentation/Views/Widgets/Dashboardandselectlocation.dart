import 'package:flutter/material.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/dropdownlocations.dart';

class Dashboardandselectlocation extends StatelessWidget {
  const Dashboardandselectlocation({
    super.key,
    required this.width,
    required this.loc,
    required this.selectedplate,
    required this.onChanged,
  });

  final double width;
  final List<String> loc;
  final String selectedplate;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: Assets.textfamily),
        ),
        SizedBox(width: width * 0.07),
        Expanded(
          child: dropdownlocations(
            list: loc,
            selectedPlate: selectedplate,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
