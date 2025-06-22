import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:parkify_admin/Core/utlis/EditandDeleteButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Delete%20location/delete_location_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Edit%20location/edit_location_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Widgets/EditBottomSheet.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo_impl.dart';

import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';
import 'package:parkify_admin/constant.dart';

class CustomLocationItem extends StatelessWidget {
  const CustomLocationItem({super.key, required this.loc, required this.token});
  final LocationModel loc;
  final String token;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
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
                'Spot Name : ${loc.name}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              Text(
                'Address : ${loc.address}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontFamily: Assets.textfamily,
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: EditandDeleteButton(
                          backcolor: const Color.fromARGB(255, 31, 141, 230),
                          width: width,
                          heaight: height,
                          text: 'Edit',
                          onPressed: () async {
                            final updated = await showModalBottomSheet(
                                backgroundColor: const Color(0xff434343),
                                context: context,
                                builder: (context) {
                                  const Color(0xff434343);
                                  return BlocProvider(
                                    create: (context) => EditLocationCubit(
                                        LocationHomeRepoImpl(ApiClass(Dio()))),
                                    child: Editbottomsheet(
                                        loc: loc,
                                        token: token,
                                        header: 'Edit Parking',
                                        buttonname: 'Edit'),
                                  );
                                });
                            if (updated == true) {
                              context
                                  .read<GetAllLocationsCubit>()
                                  .getAlllocation(token: token);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child:
                        BlocConsumer<DeleteLocationCubit, DeleteLocationState>(
                      listener: (context, state) {
                        if (state is DeleteLocationFailure) {
                          CustomScaffoldMessenger(
                              context,
                              "Error is : ${state.errmessage}",
                              FontAwesomeIcons.circleXmark);
                        } else if (state is DeleteLocationSuccess) {
                          CustomScaffoldMessenger(
                              context, 'Success', Icons.check_circle_outline);
                          context
                              .read<GetAllLocationsCubit>()
                              .getAlllocation(token: token);
                        }
                      },
                      builder: (context, state) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: EditandDeleteButton(
                              backcolor: const Color.fromARGB(255, 210, 57, 46),
                              width: width,
                              heaight: height,
                              text: 'Delete',
                              onPressed: () {
                                context
                                    .read<DeleteLocationCubit>()
                                    .deletelocation(
                                        token: token, id: loc.id.toString());
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
