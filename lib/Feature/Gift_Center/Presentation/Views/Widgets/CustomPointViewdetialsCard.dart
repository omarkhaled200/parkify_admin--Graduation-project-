import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/EditAndDeleteBottomSheet.dart';
import 'package:parkify_admin/Core/utlis/EditandDeleteButton.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/api_class.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Edit_Point_and_refund/edit_point_and_refund_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_point_view/get_point_view_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/Repo/Gift_Home_Repo_impl.dart';
import 'package:parkify_admin/constant.dart';

class CustomPointViewdetialsCard extends StatelessWidget {
  const CustomPointViewdetialsCard({
    super.key,
    required this.heaight,
    required this.width,
    required this.token,
  });

  final double heaight;
  final double width;
  final String token;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetPointViewCubit, GetPointViewState>(
      builder: (context, state) {
        if (state is GetPointViewSuccess) {
          return SizedBox(
            height: heaight * 0.3,
            child: Card(
              color: kprimaryColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Public Points Per Hours: ${state.points.public}Pts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.textfamily,
                      ),
                    ),
                    SizedBox(
                      height: heaight * 0.01,
                    ),
                    Text(
                      'Reservable Points Per Hours: ${state.points.reservable}Pts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.textfamily,
                      ),
                    ),
                    SizedBox(
                      height: heaight * 0.01,
                    ),
                    Text(
                      'Refund Percentage:${state.points.totalSuccess}%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: Assets.textfamily,
                      ),
                    ),
                    SizedBox(
                      height: heaight * 0.01,
                    ),
                    Expanded(
                      child: Center(
                        child: EditandDeleteButton(
                            width: width,
                            heaight: heaight,
                            text: 'Edit',
                            onPressed: () async {
                              final updated = await showModalBottomSheet(
                                  backgroundColor: const Color(0xff434343),
                                  context: context,
                                  builder: (context) {
                                    const Color(0xff434343);
                                    return BlocProvider(
                                      create: (context) =>
                                          EditPointAndRefundCubit(
                                              GiftHomeRepoImpl(
                                                  ApiClass(Dio()))),
                                      child: EditAndDeleteBottomSheet(
                                        token: token,
                                        header: 'Edit Points',
                                        firstfiled: 'Public Points Per Hours',
                                        secondfiled:
                                            'Reservable Points Per Hours',
                                        thirdfiled: 'Refund Percentage',
                                        buttonname: 'Edit',
                                      ),
                                    );
                                  });
                              if (updated == true) {
                                // بعد ما ترجع من صفحة التعديل وتكون العملية نجحت
                                context
                                    .read<GetPointViewCubit>()
                                    .getpointview(token: token);
                              }
                            }),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.01,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is GetPointViewFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
          return const SizedBox.shrink();
        } else {
          return const SpinKitFadingCircle(color: Colors.black);
        }
      },
    );
  }
}
