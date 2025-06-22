import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Delete%20Public%20Spots/delete_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Edit%20Public%20Spots/edit_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Public%20Spot%20Cubit/Get%20Public%20Spots/get_public_spots_cubit.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/EditPublicSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/EditSpot.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/Views/Widgets/PublicSpotDetials.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/data/Public%20Spot%20Repos/PublicSpot_Home_Repo_impl.dart';

class CustomPublicSpotGridbuilder extends StatelessWidget {
  const CustomPublicSpotGridbuilder({
    super.key,
    required this.token,
  });
  final String token;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPublicSpotsCubit, GetPublicSpotsState>(
      builder: (context, state) {
        if (state is GetPublicSpotsSuccess) {
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
                  create: (context) => DeletePublicSpotsCubit(
                      PublicspotHomeRepoImpl(ApiClass(Dio()))),
                  child: PublicSpotDetials(
                    token: token,
                    spot: state.spot[index],
                    onpressed: () async {
                      final updated = await showModalBottomSheet(
                        backgroundColor: const Color(0xff434343),
                        context: context,
                        builder: (context) {
                          const Color(0xff434343);
                          return BlocProvider(
                            create: (context) => EditPublicSpotsCubit(
                                PublicspotHomeRepoImpl(ApiClass(Dio()))),
                            child: EditPublicSpot(
                              spot: state.spot[index],
                              token: token,
                              header: 'Edit Public Spot',
                              btntext: 'Edit',
                              selectitem: 'Public Spot',
                            ),
                          );
                        },
                      );
                      if (updated == true) {
                        // بعد ما ترجع من صفحة التعديل وتكون العملية نجحت
                        context
                            .read<GetPublicSpotsCubit>()
                            .getPublicSpot(token: token);
                      }
                    },
                  ),
                );
              });
        } else if (state is GetPublicSpotsFailure) {
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
