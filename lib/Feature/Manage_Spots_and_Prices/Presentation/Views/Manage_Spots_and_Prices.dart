import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ManageSpotsAndPricesbody.dart';

class ManageSpotsAndPrices extends StatelessWidget {
  const ManageSpotsAndPrices({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return ManageSpotsAndPricesbody(
      token: token,
    );
  }
}
