import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Manage_User/Presentation/View_Model/Change%20User%20Status/change_user_status_cubit.dart';
import 'package:parkify_admin/Feature/Manage_User/data/Model/users/users.dart';

// ignore: must_be_immutable
class Dropdownactivateuser extends StatefulWidget {
  Dropdownactivateuser(
      {super.key,
      required this.list,
      required this.selectedPlate,
      this.text,
      required this.token,
      required this.users});

  String selectedPlate;
  final List<String> list;
  final String? text;
  final String token;
  final Users users;
  @override
  State<Dropdownactivateuser> createState() => _DropdownactivateuserState();
}

class _DropdownactivateuserState extends State<Dropdownactivateuser> {
  int status = 1;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedPlate.isNotEmpty
        ? widget.selectedPlate
        : widget.list.isNotEmpty
            ? widget.list.first
            : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangeUserStatusCubit, ChangeUserStatusState>(
      listener: (context, state) {
        if (state is ChangeUserStatusFailure) {
          CustomScaffoldMessenger(context, "Error is : ${state.errmessage}",
              FontAwesomeIcons.circleXmark);
        } else if (state is ChangeUserStatusSuccess) {
          CustomScaffoldMessenger(
              context, state.message, Icons.check_circle_outline);
        }
      },
      builder: (context, state) {
        if (state is ChangeUserStatusLoading) {
          return const Center(
            child: SpinKitFadingCircle(color: Colors.black),
          );
        }

        return DropdownButtonFormField<String>(
          dropdownColor: Colors.white,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: Assets.textfamily),
          decoration: InputDecoration(
            labelText: widget.text,
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: Assets.textfamily,
            ),
            enabledBorder: customOutlineinputborderdesign(),
            border: customOutlineinputborderdesign(),
            focusedBorder: customOutlineinputborderdesign(),
          ),
          value: selectedValue,
          items: widget.list.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (newvalue) {
            setState(() {
              selectedValue = newvalue!;
            });

            status = (selectedValue == 'Deactive') ? 0 : 1;

            context.read<ChangeUserStatusCubit>().changeuserstatus(
                token: widget.token,
                id: widget.users.id!,
                status: status.toString());
          },
        );
      },
    );
  }

  OutlineInputBorder customOutlineinputborderdesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    );
  }
}
