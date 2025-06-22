import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_Spots_and_Prices/Presentation/View_Model/Reservable%20Spot%20Cubit/Add%20Price/add_price_cubit.dart';
import 'package:parkify_admin/constant.dart';

class Managereservablespotpricesbody extends StatelessWidget {
  Managereservablespotpricesbody({super.key});
  String? price;
  String? fees;
  String? time;
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final extra = GoRouterState.of(context).extra as Map<String, dynamic>;
    final String token = extra['token'];
    final VoidCallback? onReturn = extra['onReturn'];

    return BlocConsumer<AddPriceCubit, AddPriceState>(
      listener: (context, state) {
        if (state is AddPriceFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is AddPriceSuccess) {
          CustomScaffoldMessenger(
              context, "Added Successfully", FontAwesomeIcons.circleXmark);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.black, size: 26),
            backgroundColor: kprimaryColor,
            foregroundColor: Colors.white,
            centerTitle: true,
            title: Image.asset(
              Assets.logopark,
              width: width * 0.25,
            ),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (onReturn != null) {
                  onReturn();
                }
                GoRouter.of(context).pop();
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Lottie.network(
                      'https://lottie.host/71b0b6e9-d618-496a-85a9-444a3b478ed2/ScY6A1gD1q.json',
                      height: heaight * 0.25,
                      width: width * 0.5,
                    ),
                  ),
                  CustomTextField(
                    hintText: 'Reservation Spot Price',
                    onchanged: (data) {
                      price = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  CustomTextField(
                    hintText: 'Set Reservation Fees',
                    onchanged: (data) {
                      fees = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  CustomTextField(
                    hintText: 'Time Restriction (in minutes)',
                    onchanged: (data) {
                      time = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  const Text(
                    '''Note: Reservation Fees =
          (Additional Hours * Reservations) ''',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: heaight * 0.05,
                  ),
                  CustomButton(
                    width: width,
                    heaight: heaight,
                    text: 'Add Price',
                    backcolor: Colors.black,
                    onPressed: () {
                      context.read<AddPriceCubit>().addPrice(
                          token: token,
                          pricePerHour: price!,
                          reservationFees: fees!,
                          timeRestriction: time!);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
