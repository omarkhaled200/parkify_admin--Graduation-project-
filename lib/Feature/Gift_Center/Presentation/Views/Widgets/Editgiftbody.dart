// ignore_for_file: public_member_api_docs, sort_constructors_first
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
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Edit_Gift/edit_gift_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/data/gift/gift_model.dart';
import 'package:parkify_admin/constant.dart';

class Editgiftbody extends StatefulWidget {
  const Editgiftbody({
    Key? key,
  }) : super(key: key);

  @override
  State<Editgiftbody> createState() => _EditgiftbodyState();
}

class _EditgiftbodyState extends State<Editgiftbody> {
  String? descrption;

  String? cost;

  String? discount;
  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final gift = extra['gift'] as Gift;
    final token = extra['token'] as String;

    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<EditGiftCubit, EditGiftState>(
      listener: (context, state) {
        if (state is EditGiftFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is EditGiftSuccess) {
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
                        'Edit New Gift',
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
                      hintText: '${gift.description}',
                      onchanged: (data) {
                        descrption = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.02,
                    ),
                    CustomTextField(
                      hintText: '${gift.discountPercentage}',
                      onchanged: (data) {
                        discount = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.02,
                    ),
                    CustomTextField(
                      hintText: '${gift.cost}',
                      onchanged: (data) {
                        cost = data;
                      },
                    ),
                    SizedBox(
                      height: heaight * 0.05,
                    ),
                    state is EditGiftLoading
                        ? const SpinKitFadingCircle(
                            color: Colors.black,
                          )
                        : CustomButton(
                            width: width,
                            heaight: heaight,
                            text: 'Edit Gift',
                            onPressed: () {
                              context.read<EditGiftCubit>().editGift(
                                  token: token,
                                  id: gift.id!,
                                  description:
                                      (descrption ?? gift.description)!,
                                  cost: (cost ?? gift.cost.toString()),
                                  discount: (discount ??
                                      gift.discountPercentage.toString()));
                            }),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
