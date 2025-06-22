import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Edit_Point_and_refund/edit_point_and_refund_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Edit%20location/edit_location_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/data/location_model/location_model.dart';

class Editbottomsheet extends StatefulWidget {
  const Editbottomsheet(
      {super.key,
      required this.header,
      required this.buttonname,
      required this.token,
      required this.loc});

  final String header;
  final String buttonname;
  final String token;
  final LocationModel loc;

  @override
  State<Editbottomsheet> createState() => _EditAndDeleteBottomSheetState();
}

class _EditAndDeleteBottomSheetState extends State<Editbottomsheet> {
  String? name;

  String? address;

  String? gpslocatoin;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditLocationCubit, EditLocationState>(
      listener: (context, state) {
        if (state is EditLocationFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is EditLocationSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline);
          GoRouter.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  widget.header,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor: Colors.white.withOpacity(0.5),
                  hintText: widget.loc.name ?? 'Name',
                  onchanged: (data) {
                    name = data;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor: Colors.white.withOpacity(0.5),
                  hintText: widget.loc.address ?? 'Address',
                  onchanged: (data) {
                    address = data;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                if (widget.loc.gpsLocation != null) ...[
                  CustomTextField(
                    textcolor: Colors.white,
                    hintcolor: Colors.white.withOpacity(0.5),
                    hintText: widget.loc.gpsLocation ?? 'GPS Location',
                    onchanged: (data) {
                      gpslocatoin = data;
                    },
                  ),
                ],
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  heaight: MediaQuery.of(context).size.height,
                  text: widget.buttonname,
                  onPressed: () {
                    context.read<EditLocationCubit>().editlocation(
                          id: widget.loc.id!,
                          token: widget.token,
                          name: name ?? widget.loc.name ?? '',
                          address: address ?? widget.loc.address ?? '',
                          gpslocation:
                              gpslocatoin ?? widget.loc.gpsLocation ?? '',
                        );
                  },
                  backcolor: const Color(0xff1D5CD1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
