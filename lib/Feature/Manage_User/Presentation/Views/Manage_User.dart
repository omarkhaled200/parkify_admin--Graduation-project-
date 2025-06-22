import 'package:flutter/material.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/ManageUserbody.dart';

class ManageUser extends StatelessWidget {
  const ManageUser({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return ManageUserbody(
      token: token,
    );
  }
}
