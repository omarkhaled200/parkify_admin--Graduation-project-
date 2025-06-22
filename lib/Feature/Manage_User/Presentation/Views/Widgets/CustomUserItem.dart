import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';
import 'package:parkify_admin/Core/utlis/EditandDeleteButton.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Change%20User%20Status/change_user_status_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/Customdspotstyperowdownforuser.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/users/users.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Repos/User_Home_Repo_impl.dart';
import 'package:parkify_admin/constant.dart';

class CustomUserItem extends StatelessWidget {
  const CustomUserItem({super.key, required this.users, required this.token});
  final Users users;
  final String token;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final statusList = ['INactive', 'Deactive'];

    // تحديد القيمة المبدئية مع التأكد إنها من ضمن القائمة
    final initialStatus = users.userData == null
        ? null
        : (users.userData!.isActive == 0 ? 'Deactive' : 'INactive');

    // تأكيد إن القيمة المبدئية موجودة فعليًا داخل القائمة
    final selectedPlate =
        (initialStatus != null && statusList.contains(initialStatus))
            ? initialStatus
            : statusList.first;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
      child: Card(
        elevation: 4,
        color: kprimaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: ${users.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Text(
                'Phone : ${users.userData?.phone ?? 'No phone'}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              SizedBox(height: height * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocProvider(
                    create: (context) => ChangeUserStatusCubit(
                        UserHomeRepoImpl(ApiClass(Dio()))),
                    child: Expanded(
                      child: Center(
                        child: Dropdownactivateuser(
                          token: token,
                          users: users,
                          list: statusList,
                          selectedPlate: selectedPlate,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EditandDeleteButton(
                          backcolor: Colors.black,
                          width: width,
                          heaight: height,
                          text: 'View',
                          onPressed: () {
                            GoRouter.of(context).push(
                              AppRouter.userdetils,
                              extra: {
                                'id': users.id,
                                'token': token,
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
