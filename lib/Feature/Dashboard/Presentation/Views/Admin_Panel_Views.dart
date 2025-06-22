import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Admin_data_page.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/StatisticsPage.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/pointView.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Manage_Parking_location.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Manage_Spots_and_Prices.dart';

import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/Manage_User.dart';
import 'package:parkify_admin/constant.dart';

class AdminPanelViews extends StatelessWidget {
  const AdminPanelViews({super.key});

  @override
  Widget build(BuildContext context) {
    final token = GoRouterState.of(context).extra as String?;

    return AdminPanelViewsbody(
      token: token!,
    );
  }
}

class AdminPanelViewsbody extends StatefulWidget {
  const AdminPanelViewsbody({super.key, required this.token});
  final String token;

  @override
  State<AdminPanelViewsbody> createState() => _AdminPanelViewsbodyState();
}

class _AdminPanelViewsbodyState extends State<AdminPanelViewsbody> {
  int _currentIndex = 0;

  void _onDrawerItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    Navigator.pop(context); // لإغلاق الـ Drawer بعد الضغط على العنصر
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = [
      Statisticspage(
        token: widget.token,
      ),
      ManageParkingLocation(
        token: widget.token,
      ),
      ManageSpotsAndPrices(
        token: widget.token,
      ),
      Pointview(
        token: widget.token,
      ),
      ManageUser(
        token: widget.token,
      ),
      AdminDataPage(
        token: widget.token,
      )
    ];

    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 26),
        backgroundColor: kprimaryColor,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          Assets.logopark,
          width: width * 0.25,
        ),
      ),
      drawer: Drawer(
        backgroundColor: kprimaryColor,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Image.asset(
                Assets.logopark,
                width: width * 0.5,
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: const Icon(
                Icons.bar_chart_rounded,
                color: Colors.black,
                size: 26,
              ),
              title: Text(
                "Statistics Page",
                style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              onTap: () => _onDrawerItemTapped(0),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.squareParking,
                color: Colors.black,
                size: 26,
              ),
              title: Text("Manage parking location",
                  style: TextStyle(
                    fontFamily: Assets.textfamily,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )),
              onTap: () => _onDrawerItemTapped(1),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.warehouse,
                color: Colors.black,
                size: 22,
              ),
              title: Text("Manage Spot and Prices",
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              onTap: () => _onDrawerItemTapped(2),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.gift,
                color: Colors.black,
                size: 26,
              ),
              title: Text("Gift Center",
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              onTap: () => _onDrawerItemTapped(3),
            ),
            ListTile(
              leading: const Icon(
                // FontAwesomeIcons.userGroup,
                Icons.manage_accounts_rounded,
                color: Colors.black,
                size: 26,
              ),
              title: Text("Manage User",
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              onTap: () => _onDrawerItemTapped(4),
            ),
            ListTile(
              leading: const Icon(
                Icons.admin_panel_settings,
                color: Colors.black,
                size: 26,
              ),
              title: Text("Admin Page",
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              onTap: () => _onDrawerItemTapped(5),
            ),
            ListTile(
              leading: const Icon(
                FontAwesomeIcons.rightFromBracket,
                color: Colors.black,
                size: 26,
              ),
              title: Text("Sign Out",
                  style: TextStyle(
                      fontFamily: Assets.textfamily,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              onTap: () {
                GoRouter.of(context).go('/');
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
    );
  }
}
