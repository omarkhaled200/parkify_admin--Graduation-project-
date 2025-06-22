import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/EditandDeleteButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Core/utlis/CustomSpotsTypeDrowdown.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Edit%20Public%20Spots/edit_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/public_spot_modal/public_spot_modal.dart';

class EditPublicSpot extends StatelessWidget {
  EditPublicSpot({
    super.key,
    required this.header,
    required this.btntext,
    required this.selectitem,
    required this.spot,
    required this.token,
  });
  final PublicSpotModal spot;
  final String token;
  final String header;
  final String btntext;
  final String? selectitem;
  String? spotname;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<EditPublicSpotsCubit, EditPublicSpotsState>(
      listener: (context, state) {
        if (state is EditPublicSpotsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is EditPublicSpotsSuccess) {
          CustomScaffoldMessenger(
              context, "Edit Successfully", FontAwesomeIcons.circleXmark);
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
                  height: heaight * 0.05,
                ),
                CustomTextField(
                  onchanged: (data) {
                    spotname = data;
                  },
                  textcolor: Colors.white,
                  hintcolor:
                      const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.5),
                  hintText: 'Spot Name',
                ),
                SizedBox(
                  height: heaight * 0.03,
                ),
                Customdspotstyperowdown(
                  list: const [
                    'Spot Type',
                    'Reservable Spot',
                    'Public Spot',
                  ],
                  selectedPlate: selectitem!,
                ),
                SizedBox(
                  height: heaight * 0.05,
                ),
                EditandDeleteButton(
                    backcolor: const Color(0xff1D5CD1),
                    width: width,
                    heaight: heaight,
                    text: btntext,
                    onPressed: () {
                      context.read<EditPublicSpotsCubit>().EditReservableSpot(
                          id: spot.id!,
                          token: token,
                          spotcode: spotname!,
                          managementid: spot.managementId.toString(),
                          locationid: spot.locationId.toString());
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
