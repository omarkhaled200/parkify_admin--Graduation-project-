import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Get%20User%20Logs/get_user_logs_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/UserDetilsbody.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo_impl.dart';

class UserDetils extends StatelessWidget {
  const UserDetils({super.key, required this.token, required this.id});
  final String token;
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserLogsCubit(UserHomeRepoImpl(ApiClass(Dio())))
        ..getuserlogs(token: token, id: id),
      child: const UserDetilsbody(),
    );
  }
}
