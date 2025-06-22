import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Add_New_Gift/add_gift_cubit.dart';
import 'package:parkify_admin/constant.dart';

class AddGiftbody extends StatefulWidget {
  const AddGiftbody({super.key});

  @override
  State<AddGiftbody> createState() => _AddGiftbodyState();
}

class _AddGiftbodyState extends State<AddGiftbody> {
  String? descrption;

  String? cost;

  String? discount;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final token = GoRouterState.of(context).extra as String;
    return BlocConsumer<AddGiftCubit, AddGiftState>(
      listener: (context, state) {
        if (state is AddGiftFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is AddGiftSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline);
          GoRouter.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: kprimaryColor,
              title: Image.asset(Assets.logopark, width: width * 0.3),
              centerTitle: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: heaight * 0.02,
                    ),
                    Center(
                      child: Text(
                        'Add New Gift',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: Assets.textfamily,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heaight * 0.01,
                    ),
                    Lottie.network(
                      'https://lottie.host/4de86e6a-3ecc-4a19-bb9d-5800ae5dd86a/nmUf2SFLua.json',
                      width: width * 0.7,
                    ),
                    CustomTextField(
                      hintText: 'Description',
                      onchanged: (data) {
                        descrption = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.02,
                    ),
                    CustomTextField(
                      hintText: 'Discount  Percentage',
                      onchanged: (data) {
                        discount = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.02,
                    ),
                    CustomTextField(
                      hintText: 'Points Cost',
                      onchanged: (data) {
                        cost = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.05,
                    ),
                    state is AddGiftLoading
                        ? const SpinKitFadingCircle(
                            color: Colors.black,
                          )
                        : CustomButton(
                            width: width,
                            heaight: heaight,
                            text: 'Add Gift',
                            onPressed: () {
                              context.read<AddGiftCubit>().addGift(
                                  token: token,
                                  description: descrption!,
                                  cost: cost!,
                                  discount: discount!);
                            }),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
