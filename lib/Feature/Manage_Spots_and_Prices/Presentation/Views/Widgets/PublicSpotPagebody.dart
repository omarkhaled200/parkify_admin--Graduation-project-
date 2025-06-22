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
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Add%20Public%20Spots/add_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Get%20Public%20Spots/get_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Spot%20Detials%20Cubit/Get%20Spot%20Detials/get_spot_detials_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/AddPublicSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/CustomPublicSpotGridbuilder.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/DisplaySpotandpricesDetials.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/AddSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo_impl.dart';

class PublicSpotPagebody extends StatelessWidget {
  const PublicSpotPagebody({super.key, required this.token});
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
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        DisplaySpotandpricesDetials(
                          height: height,
                          text1: 'Price \n Per Hour',
                          text2: 'Additional \nguest fees',
                          text3: 'Time \n Retriction',
                          textprice1: state.spot.first.pricePerHour.toString(),
                          textprice2:
                              state.spot.first.additionalGuestFees.toString(),
                          texthour: state.spot.first.timeRestriction.toString(),
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
                                            AddPublicSpotsCubit(
                                                PublicspotHomeRepoImpl(
                                                    ApiClass(Dio()))),
                                        child: AddPublicSpot(
                                          token: token,
                                          header: 'Add Public Spot',
                                          btntext: 'Add',
                                        ),
                                      );
                                    },
                                  );
                                  if (updated == true) {
                                    context
                                        .read<GetPublicSpotsCubit>()
                                        .getPublicSpot(token: token);
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
                                    AppRouter.managePublicprices,
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
                  CustomPublicSpotGridbuilder(
                    token: token,
                  ),
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
