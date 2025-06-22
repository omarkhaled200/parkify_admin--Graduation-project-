import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Delete%20location/delete_location_cubit.dart';

import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Widgets/CustomLocationItem.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo_impl.dart';

class CustomListViewLocationItem extends StatelessWidget {
  const CustomListViewLocationItem({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllLocationsCubit, GetAllLocationsState>(
      builder: (context, state) {
        if (state is GetAllLocationsSuccess) {
          return ListView.builder(
              itemCount: state.location.length,
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => DeleteLocationCubit(
                      LocationHomeRepoImpl(ApiClass(Dio()))),
                  child: CustomLocationItem(
                    token: token,
                    loc: state.location[index],
                  ),
                );
              });
        } else if (state is GetAllLocationsFailure) {
          CustomScaffoldMessenger(
            context,
            "Error is : ${state.errmessage}",
            FontAwesomeIcons.circleXmark,
          );
          return const Center(
            child: Text('Failed to load users'),
          );
        } else {
          return const Center(
            child: SpinKitFadingCircle(color: Colors.black),
          );
        }
      },
    );
  }
}
