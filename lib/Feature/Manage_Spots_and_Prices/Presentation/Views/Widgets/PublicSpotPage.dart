import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/PublicSpotPagebody.dart';

class Publicspotpage extends StatelessWidget {
  const Publicspotpage({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return PublicSpotPagebody(
      token: token,
    );
  }
}
