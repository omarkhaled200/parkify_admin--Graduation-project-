import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Get_All_User/get_all_user_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/CustomListViewUserItem.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo_impl.dart';

class ManageUserbody extends StatelessWidget {
  const ManageUserbody({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: heaight * 0.02,
        ),
        Center(
          child: Text(
            'Manage User',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: Assets.textfamily,
            ),
          ),
        ),
        SizedBox(
          height: heaight * 0.02,
        ),
        BlocProvider(
          create: (context) =>
              GetAllUserCubit(UserHomeRepoImpl(ApiClass(Dio())))
                ..GetallUsers(token: token),
          child: Expanded(
              child: CustomListViewUserItem(
            token: token,
          )),
        )
      ],
    ));
  }
}
