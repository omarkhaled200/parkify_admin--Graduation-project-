import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Widgets/ManageParkingLocationbody.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo_impl.dart';

class ManageParkingLocation extends StatelessWidget {
  const ManageParkingLocation({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllLocationsCubit(LocationHomeRepoImpl(ApiClass(Dio())))
            ..getAlllocation(token: token),
      child: ManageParkingLocationbody(
        token: token,
      ),
    );
  }
}
