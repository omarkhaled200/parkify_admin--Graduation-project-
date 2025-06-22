import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Delete%20Reservable%20Spot/delete_reservable_spot_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Edit%20Reservable%20Spot/edit_reservable_spot_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Get%20Reservable%20Spots/get_reservable_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/EditSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/ReservableSpotDetials.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo_impl.dart';

class CustomReservableSpotGridBuilder extends StatelessWidget {
  const CustomReservableSpotGridBuilder({
    super.key,
    required this.token,
  });
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetReservableSpotsCubit, GetReservableSpotsState>(
      builder: (context, state) {
        if (state is GetReservableSpotsSuccess) {
          return SliverGrid.builder(
              itemCount: state.spot.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.15,
              ),
              itemBuilder: (context, index) {
                return BlocProvider(
                  create: (context) => DeleteReservableSpotCubit(
                      ReservablespotHomeRepoImpl(apiClass: ApiClass(Dio()))),
                  child: SpotDetials(
                    spot: state.spot[index],
                    token: token,
                    onpressed: () async {
                      final updated = await showModalBottomSheet(
                        backgroundColor: const Color(0xff434343),
                        context: context,
                        builder: (context) {
                          const Color(0xff434343);
                          return BlocProvider(
                            create: (context) => EditReservableSpotCubit(
                                ReservablespotHomeRepoImpl(
                                    apiClass: ApiClass(Dio()))),
                            child: EditSpot(
                              token: token,
                              spot: state.spot[index],
                              header: 'Edit Reservable Spot',
                              btntext: 'Edit',
                              selectitem: 'Reservable Spot',
                            ),
                          );
                        },
                      );
                      if (updated == true) {
                        // بعد ما ترجع من صفحة التعديل وتكون العملية نجحت
                        context
                            .read<GetReservableSpotsCubit>()
                            .getReservablespot(token: token);
                      }
                    },
                  ),
                );
              });
        } else if (state is GetReservableSpotsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        } else {
          return const SliverToBoxAdapter(
              child: Center(child: SpinKitFadingCircle(color: Colors.black)));
        }
      },
    );
  }
}
