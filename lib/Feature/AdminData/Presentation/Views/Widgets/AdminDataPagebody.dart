import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/View_model/Get%20All%20Admin%20data/get_all_admin_data_cubit.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/ActivityLogListview.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/AdminDatalistview.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/CustomRowDisplaydata.dart';
import 'package:parkify_admin/Feature/AdminData/data/Repos/AdminData_Home_Repo_impl.dart';
import 'package:parkify_admin/constant.dart';

class AdminDataPagebody extends StatefulWidget {
  const AdminDataPagebody({super.key, required this.token});
  final String token;
  @override
  State<AdminDataPagebody> createState() => _AdminDataPagebodyState();
}

class _AdminDataPagebodyState extends State<AdminDataPagebody> {
  // إضافة GlobalKey فريد للـ Scaffold
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0; // 0 = Admin List, 1 = Activity Log

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _scaffoldKey, // إضافة key فريد للـ Scaffold
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Admin Panel Management',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: Assets.textfamily,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Center(
                  child: Text(
                    'Manage administrators and monitor system activity',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),
                // إضافة key فريد للـ CustomDisplayrowdata
                BlocProvider(
                  create: (context) => GetAllAdminDataCubit(
                      AdmindataHomeRepoImpl(ApiClass(Dio())))
                    ..GetAllAdminData(token: widget.token),
                  child: CustomDisplayrowdata(
                    key: const ValueKey('admin_display_row_data'),
                    width: width,
                  ),
                ),
                SizedBox(height: height * 0.02),
                CustomButton(
                  width: width,
                  heaight: height,
                  text: 'Add New Admin',
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.addadmin);
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(height: height * 0.02),

                // التبويبات
                Container(
                  key: const ValueKey('tabs_container'), // إضافة key فريد
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildTabButton(
                            icon: Icons.group_outlined,
                            label: 'Admin List',
                            index: 0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTabButton(
                            icon: Icons.monitor_heart_outlined,
                            label: 'Activity Log',
                            index: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),

          // المحتوى المتغير حسب التبويب المختار
          selectedIndex == 0
              ? BlocProvider(
                  create: (context) => GetAllAdminDataCubit(
                      AdmindataHomeRepoImpl(ApiClass(Dio())))
                    ..GetAllAdminData(token: widget.token),
                  child: AdminDatalistview(width: width, height: height),
                )
              : ActivityLogListview(width: width, height: height),
        ]),
      ),
    );
  }

  Widget _buildTabButton({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return GestureDetector(
      key: ValueKey('tab_button_$index'), // إضافة key فريد لكل تبويب
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.black87),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
