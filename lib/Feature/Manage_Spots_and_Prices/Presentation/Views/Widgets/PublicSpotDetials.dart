import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Delete%20Public%20Spots/delete_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Get%20Public%20Spots/get_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/public_spot_modal/public_spot_modal.dart';

import 'package:parkify_admin/constant.dart';

class PublicSpotDetials extends StatelessWidget {
  const PublicSpotDetials(
      {super.key,
      required this.onpressed,
      required this.spot,
      required this.token});
  final void Function()? onpressed;
  final PublicSpotModal spot;
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeletePublicSpotsCubit, DeletePublicSpotsState>(
      listener: (context, state) {
        if (state is DeletePublicSpotsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is DeletePublicSpotsSuccess) {
          CustomScaffoldMessenger(
              context, "Deleted Successfully", FontAwesomeIcons.circleXmark);
          context.read<GetPublicSpotsCubit>().getPublicSpot(token: token);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: kprimaryColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Spot Code: ${spot.spotCode}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Text(
                  'Location: ${spot.locationId}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: Assets.textfamily,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: onpressed,
                      icon: Icon(FontAwesomeIcons.penToSquare),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        context
                            .read<DeletePublicSpotsCubit>()
                            .DeleteReservableSpot(
                                token: token, id: spot.id.toString());
                      },
                      icon: const Icon(
                        FontAwesomeIcons.solidTrashCan,
                        color: Color.fromARGB(255, 168, 0, 0),
                        size: 24,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
