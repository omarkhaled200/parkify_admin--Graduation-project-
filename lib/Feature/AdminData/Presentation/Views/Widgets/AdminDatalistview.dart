import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/View_model/Get%20All%20Admin%20data/get_all_admin_data_cubit.dart';
import 'package:parkify_admin/Feature/AdminData/data/admin_data_model/admin_data_model.dart';

class AdminDatalistview extends StatelessWidget {
  const AdminDatalistview({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllAdminDataCubit, GetAllAdminDataState>(
      builder: (context, state) {
        if (state is GetAllAdminDataSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return AdminDataView(
                  width: width,
                  height: height,
                  data: state.data[index],
                );
              },
              childCount: state.data.length,
            ),
          );
        } else if (state is GetAllAdminDataFailure) {
          print('the error is ${state.errmessage}');
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Failed to load statistics',
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              child: SpinKitFadingCircle(color: Colors.black),
            ),
          );
        }
      },
    );
  }
}

class AdminDataView extends StatelessWidget {
  const AdminDataView({
    super.key,
    required this.width,
    required this.height,
    required this.data,
  });

  final double width;
  final double height;
  final AdminDataModel data;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        data.name!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: width * 0.3,
                        // height: height * 0.3,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6), // علشان يبقى في مسافة حوالين الكلام
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Text(
                            data.activity!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.admin_panel_settings_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data.role!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.email_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data.email!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Created At: ${data.createdAt}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            PopupMenuButton(
              menuPadding: const EdgeInsets.all(12),
              elevation: 5,
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.penToSquare,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: Assets.textfamily,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.person_off_outlined,
                          color: Colors.redAccent,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Deactivate',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.redAccent,
                              fontFamily: Assets.textfamily,
                              fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            )
          ],
        ),
      ),
    );
  }
}
