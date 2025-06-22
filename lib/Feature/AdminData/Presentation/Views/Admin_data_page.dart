import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/AdminDataPagebody.dart';

class AdminDataPage extends StatelessWidget {
  const AdminDataPage({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return AdminDataPagebody(
      token: token,
    );
  }
}
