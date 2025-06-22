import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/View_model/Get%20All%20Admin%20data/get_all_admin_data_cubit.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/CustomCardadmindata.dart';

class CustomDisplayrowdata extends StatelessWidget {
  const CustomDisplayrowdata({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAdminDataCubit, GetAllAdminDataState>(
      builder: (context, state) {
        if (state is GetAllAdminDataSuccess) {
          return Row(
            children: [
              Expanded(
                child: CustomCardadmindata(
                    icon: Icons.people_alt_outlined,
                    iconcolor: Colors.black,
                    text1: '${state.data.length}',
                    text2: 'Total Admins'),
              ),
              SizedBox(
                width: width * 0.01,
              ),
              Expanded(
                child: CustomCardadmindata(
                    icon: Icons.verified_user,
                    iconcolor: Colors.green.shade500,
                    text1: '${state.data.length}',
                    text2: 'Active Admins'),
              ),
            ],
          );
        } else if (state is GetAllAdminDataFailure) {
          return const Center(child: Text('failed to load data'));
        } else {
          return const Center(
            child: SpinKitFadingCircle(color: Colors.black),
          );
        }
      },
    );
  }
}
