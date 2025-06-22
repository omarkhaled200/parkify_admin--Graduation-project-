import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Parking_Location/Presentation/View_Model/Add%20location/add_location_cubit.dart';

class Addbottomsheet extends StatefulWidget {
  const Addbottomsheet(
      {super.key,
      required this.header,
      required this.firstfiled,
      required this.secondfiled,
      required this.thirdfiled,
      required this.buttonname,
      required this.token});

  final String header;
  final String firstfiled;
  final String secondfiled;
  final String thirdfiled;
  final String buttonname;
  final String token;

  @override
  State<Addbottomsheet> createState() => _EditAndDeleteBottomSheetState();
}

class _EditAndDeleteBottomSheetState extends State<Addbottomsheet> {
  String? name;

  String? address;

  String? gpslocatoin;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddLocationCubit, AddLocationState>(
      listener: (context, state) {
        if (state is AddLocationFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is AddLocationSuccess) {
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
                  hintText: widget.firstfiled,
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
                  hintText: widget.secondfiled,
                  onchanged: (data) {
                    address = data;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                if (widget.thirdfiled != null) ...[
                  CustomTextField(
                    textcolor: Colors.white,
                    hintcolor: Colors.white.withOpacity(0.5),
                    hintText: widget.thirdfiled,
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
                    context.read<AddLocationCubit>().addlocation(
                        token: widget.token,
                        name: name!,
                        address: address!,
                        gpslocation: gpslocatoin!);
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
