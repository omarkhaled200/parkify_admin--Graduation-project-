import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Get_All_User/get_all_user_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/CustomUserItem.dart';

class CustomListViewUserItem extends StatelessWidget {
  const CustomListViewUserItem({super.key, required this.token});
  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllUserCubit, GetAllUserState>(
      builder: (context, state) {
        if (state is GetAllUserSuccess) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return CustomUserItem(
                token: token,
                users: state.users[index],
              );
            },
          );
        } else if (state is GetAllUserFailure) {
          // تأجيل عرض الـ SnackBar بعد البناء
          WidgetsBinding.instance.addPostFrameCallback((_) {
            CustomScaffoldMessenger(
              context,
              "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark,
            );
          });

          return const Center(
            child: Text('Failed to load users'),
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(
              color: Colors.black,
            ),
          );
        }
      },
    );
  }
}
