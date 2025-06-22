import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ReservableSpotPagebody.dart';

class ReservableSpotPage extends StatelessWidget {
  const ReservableSpotPage({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return ReservableSpotPagebody(
      token: token,
    );
  }
}
