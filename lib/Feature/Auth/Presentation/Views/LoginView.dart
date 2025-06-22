import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Auth/Presentation/View_Model/cubit/admin_login_to_account_cubit.dart';
import 'package:parkify_admin/Feature/Auth/Presentation/Views/Widgets/login_view_body.dart';
import 'package:parkify_admin/Feature/Auth/data/Repo_Auth/Home_Repo_Auth_impl.dart';

class Loginview extends StatelessWidget {
  const Loginview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AdminLoginToAccountCubit(HomeRepoImpl(ApiClass(Dio()))),
      child: const LoginViewBody(),
    );
  }
}
