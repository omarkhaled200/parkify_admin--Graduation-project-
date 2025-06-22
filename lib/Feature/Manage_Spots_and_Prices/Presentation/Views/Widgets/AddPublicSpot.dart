import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/EditandDeleteButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Dashboard/Presentation/Views/Widgets/dropdownlocations.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Add%20Public%20Spots/add_public_spots_cubit.dart';

class AddPublicSpot extends StatelessWidget {
  AddPublicSpot({
    super.key,
    required this.header,
    required this.btntext,
    required this.token,
  });

  final String token;
  final String header;
  final String btntext;
  String? spotname;
  String? manageid;
  String? locid;

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AddPublicSpotsCubit, AddPublicSpotsState>(
      listener: (context, state) {
        if (state is AddPublicSpotsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is AddPublicSpotsSuccess) {
          CustomScaffoldMessenger(
              context, "Added Successfully", FontAwesomeIcons.circleXmark);
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
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  header,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: heaight * 0.03,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor:
                      const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
                  hintText: 'Spot Name',
                  onchanged: (data) {
                    spotname = data;
                  },
                ),
                SizedBox(
                  height: heaight * 0.03,
                ),
                dropdownlocations(
                  list: ['Benha', 'Obur'],
                  selectedPlate: 'Benha',
                  onChanged: (val) {
                    locid = val;
                  },
                ),
                SizedBox(
                  height: heaight * 0.03,
                ),
                EditandDeleteButton(
                    backcolor: const Color(0xff1D5CD1),
                    width: width,
                    heaight: heaight,
                    text: btntext,
                    onPressed: () {
                      context.read<AddPublicSpotsCubit>().addPublicpot(
                          token: token,
                          spotcode: spotname!,
                          managementid: '2',
                          locationid: locid == 'Benha' ? '1' : '2');
                    }),
                SizedBox(
                  height: heaight * 0.05,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
