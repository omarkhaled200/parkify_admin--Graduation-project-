import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Delete%20Reservable%20Spot/delete_reservable_spot_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Get%20Reservable%20Spots/get_reservable_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/reservabile_spot_model/reservabile_spot_model.dart';
import 'package:parkify_admin/constant.dart';

class SpotDetials extends StatelessWidget {
  const SpotDetials(
      {super.key,
      required this.onpressed,
      required this.spot,
      required this.token});
  final void Function()? onpressed;
  final ReservableSpotModel spot;
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteReservableSpotCubit, DeleteReservableSpotState>(
      listener: (context, state) {
        if (state is DeleteReservableSpotFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is DeleteReservableSpotSuccess) {
          CustomScaffoldMessenger(
              context, "Deleted Successfully", FontAwesomeIcons.circleXmark);
          context
              .read<GetReservableSpotsCubit>()
              .getReservablespot(token: token);
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
                            .read<DeleteReservableSpotCubit>()
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
