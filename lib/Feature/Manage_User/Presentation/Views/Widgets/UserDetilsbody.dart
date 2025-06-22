import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Get%20User%20Logs/get_user_logs_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/HistoryListViewItem.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Widgets/UserDetailsContainer.dart';
import 'package:parkify_admin/constant.dart';
import 'package:flutter/scheduler.dart';

class UserDetilsbody extends StatelessWidget {
  const UserDetilsbody({super.key});

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<GetUserLogsCubit, GetUserLogsState>(
      builder: (context, state) {
        if (state is GetUserLogsSuccess) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              title: Image.asset(
                Assets.logopark,
                width: width * 0.3,
              ),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(12),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'User Details',
                            style: TextStyle(
                              fontFamily: Assets.textfamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heaight * 0.02,
                        ),
                        UserDetailsContainer(
                          heaight: heaight,
                          logs: state.logs,
                        ),
                        SizedBox(
                          height: heaight * 0.02,
                        ),
                        Text(
                          'User History',
                          style: TextStyle(
                            fontFamily: Assets.textfamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(
                          height: heaight * 0.02,
                        ),
                      ],
                    ),
                  ),
                  SliverList.builder(
                      itemCount: state.logs.recentLogs?.length ?? 0,
                      itemBuilder: (context, index) {
                        final log = state.logs.recentLogs![index];
                        return HistoryListViewItem(item: log);
                      })
                ],
              ),
            ),
          );
        } else if (state is GetUserLogsFailure) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            CustomScaffoldMessenger(
              context,
              "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark,
            );
          });
          return const Center(
            child: Scaffold(body: Center(child: Text('Failed to load users'))),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: SpinKitFadingCircle(
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
