import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';

import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Add%20Reservable%20Spot/add_reservable_spot_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Get%20Reservable%20Spots/get_reservable_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/CustomReservableSpotGridBuilder.dart';

import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/DisplaySpotandpricesDetials.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/AddSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Reservable%20Spot%20Repos/ReservableSpot_Home_Repo_impl.dart';

class ReservableSpotPagebody extends StatelessWidget {
  const ReservableSpotPagebody({super.key, required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<GetSpotDetialsCubit, GetSpotDetialsState>(
      builder: (context, state) {
        if (state is GetSpotDetialsSuccess) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        DisplaySpotandpricesDetials(
                          height: height,
                          text1: 'Price \nPer Hour',
                          text2: 'Reservation\nFees',
                          text3: 'Time \n Retriction',
                          textprice1: state.spot.last.pricePerHour.toString(),
                          textprice2:
                              state.spot.last.reservationFees.toString(),
                          texthour: state.spot.last.timeRestriction.toString(),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                width: width,
                                heaight: height,
                                text: 'Add Spot',
                                onPressed: () async {
                                  final updated = await showModalBottomSheet(
                                    backgroundColor: const Color(0xff434343),
                                    context: context,
                                    builder: (context) {
                                      const Color(0xff434343);
                                      return BlocProvider(
                                        create: (context) =>
                                            AddReservableSpotCubit(
                                                ReservablespotHomeRepoImpl(
                                                    apiClass: ApiClass(Dio()))),
                                        child: AddReservableSpot(
                                          token: token,
                                          header: 'Add Reservable Spot',
                                          btntext: 'Add',
                                        ),
                                      );
                                    },
                                  );
                                  if (updated == true) {
                                    context
                                        .read<GetReservableSpotsCubit>()
                                        .getReservablespot(token: token);
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Expanded(
                              child: CustomButton(
                                width: width,
                                heaight: height,
                                text: 'Manage Prices',
                                onPressed: () {
                                  GoRouter.of(context).push(
                                    AppRouter.managereservableprices,
                                    extra: {
                                      "token": token,
                                      "onReturn": () {
                                        context
                                            .read<GetSpotDetialsCubit>()
                                            .getSpotDetials(token: token);
                                      },
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ),
                  CustomReservableSpotGridBuilder(
                    token: token,
                  )
                ],
              ),
            ),
          );
        } else if (state is GetSpotDetialsFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
          return const SizedBox.shrink();
        } else {
          return const Center(child: SpinKitFadingCircle(color: Colors.black));
        }
      },
    );
  }
}
