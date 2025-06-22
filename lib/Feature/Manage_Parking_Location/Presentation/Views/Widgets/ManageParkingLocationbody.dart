import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Add%20location/add_location_cubit.dart';

import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Get%20all%20locations/get_all_locations_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Widgets/CustomListViewLocationItem.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/Views/Widgets/addbottomsheet.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/Location_Repo/Location_Home_Repo_impl.dart';

class ManageParkingLocationbody extends StatefulWidget {
  const ManageParkingLocationbody({super.key, required this.token});
  final String token;

  @override
  State<ManageParkingLocationbody> createState() =>
      _ManageParkingLocationbodyState();
}

class _ManageParkingLocationbodyState extends State<ManageParkingLocationbody> {
  late final GetAllLocationsCubit _locationsCubit;

  @override
  void initState() {
    super.initState();
    _locationsCubit = GetAllLocationsCubit(
      LocationHomeRepoImpl(ApiClass(Dio())),
    );
    _locationsCubit.getAlllocation(token: widget.token);
  }

  @override
  void dispose() {
    _locationsCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider.value(
        value: _locationsCubit,
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Center(
              child: Text(
                'Manage Parking Location',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: Assets.textfamily,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            CustomButton(
              width: width,
              heaight: height,
              text: 'Add Location',
              onPressed: () async {
                final updated = await showModalBottomSheet(
                  backgroundColor: const Color(0xff434343),
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => AddLocationCubit(
                        LocationHomeRepoImpl(ApiClass(Dio())),
                      ),
                      child: Addbottomsheet(
                        token: widget.token,
                        header: 'Add Parking',
                        firstfiled: 'Name',
                        secondfiled: 'Address',
                        thirdfiled: 'GPS Location',
                        buttonname: 'Add',
                      ),
                    );
                  },
                );

                if (updated == true && mounted) {
                  _locationsCubit.getAlllocation(token: widget.token);
                }
              },
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: CustomListViewLocationItem(
                token: widget.token,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
