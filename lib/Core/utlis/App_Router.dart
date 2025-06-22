import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/AddNewAdmin.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Admin_data_page.dart';
import 'package:parkify_admin/Feature/Auth/Presentation/Views/LoginView.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Admin_Panel_Views.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/AddGift.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/Views/EditGift.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ManageReservableSpotPrices.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/Managepublicpotprices.dart';

import 'package:parkify_admin/Feature/Manage_User/Presentation/Views/User_Detils.dart';

abstract class AppRouter {
  static final loginview = '/loginview';
  static final Adminpanelviews = '/adminpanelviews';
  static final managereservableprices = '/managereservableprices';
  static final managePublicprices = '/managePublicprices';
  static final addgift = '/addgift';
  static final editgift = '/editgift';
  static final userdetils = '/userdetils';
  static final adminpage = '/adminpage';
  static final addadmin = '/addadmin';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Loginview(),
      ),
      GoRoute(
        path: Adminpanelviews,
        builder: (context, state) => const AdminPanelViews(),
      ),
      GoRoute(
        path: addadmin,
        builder: (context, state) => const Addnewadmin(),
      ),
      GoRoute(
        path: adminpage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return AdminDataPage(
            token: data['token'],
          );
        },
      ),
      GoRoute(
        path: managereservableprices,
        builder: (context, state) => const Managereservablespotprices(),
      ),
      GoRoute(
        path: managePublicprices,
        builder: (context, state) => const Managepublicpotprices(),
      ),
      GoRoute(
        path: addgift,
        builder: (context, state) => const AddGift(),
      ),
      GoRoute(
        path: editgift,
        builder: (context, state) => const Editgift(),
      ),
      GoRoute(
        path: userdetils,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return UserDetils(
            token: data['token'],
            id: data['id'],
          );
        },
      ),
    ],
  );
}
