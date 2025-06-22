import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Edit_Point_and_refund/edit_point_and_refund_cubit.dart';
import 'package:parkify_admin/Feature/Gift_Center/Presentation/View_Model/Get_point_view/get_point_view_cubit.dart';

class EditAndDeleteBottomSheet extends StatefulWidget {
  const EditAndDeleteBottomSheet(
      {super.key,
      required this.header,
      required this.firstfiled,
      required this.secondfiled,
      required this.thirdfiled,
      required this.buttonname,
      required this.token});

  final String header;
  final String firstfiled;
  final String secondfiled;
  final String thirdfiled;
  final String buttonname;
  final String token;

  @override
  State<EditAndDeleteBottomSheet> createState() =>
      _EditAndDeleteBottomSheetState();
}

class _EditAndDeleteBottomSheetState extends State<EditAndDeleteBottomSheet> {
  String? publicpoint;

  String? reservablepoint;

  String? refund;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditPointAndRefundCubit, EditPointAndRefundState>(
      listener: (context, state) {
        if (state is EditPointAndRefundFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is EditPointAndRefundSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline);
          GoRouter.of(context).pop(true);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  widget.header,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: Assets.textfamily,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor: Colors.white.withOpacity(0.5),
                  hintText: widget.firstfiled,
                  onchanged: (data) {
                    publicpoint = data;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomTextField(
                  textcolor: Colors.white,
                  hintcolor: Colors.white.withOpacity(0.5),
                  hintText: widget.secondfiled,
                  onchanged: (data) {
                    reservablepoint = data;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                if (widget.thirdfiled != null) ...[
                  CustomTextField(
                    textcolor: Colors.white,
                    hintcolor: Colors.white.withOpacity(0.5),
                    hintText: widget.thirdfiled!,
                    onchanged: (data) {
                      refund = data;
                    },
                  ),
                ],
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                CustomButton(
                  width: MediaQuery.of(context).size.width,
                  heaight: MediaQuery.of(context).size.height,
                  text: widget.buttonname,
                  onPressed: () {
                    context.read<EditPointAndRefundCubit>().editpointandrefund(
                        token: widget.token,
                        publicpointsperhour: publicpoint!,
                        reservablepointsperhour: reservablepoint!,
                        percentage: refund!);
                  },
                  backcolor: const Color(0xff1D5CD1),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
