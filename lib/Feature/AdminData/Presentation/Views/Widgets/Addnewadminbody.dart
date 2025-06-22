import 'package:flutter/material.dart';

import 'package:parkify_admin/Core/utlis/CustomButton.dart';

import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
// import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/AdminData/Presentation/Views/Widgets/adminroledropdown.dart';
import 'package:parkify_admin/constant.dart';

class Addnewadminbody extends StatefulWidget {
  const Addnewadminbody({super.key});

  @override
  State<Addnewadminbody> createState() => _AddnewadminbodyState();
}

class _AddnewadminbodyState extends State<Addnewadminbody> {
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
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
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     if (onReturn != null) {
        //       onReturn();
        //     }
        //     GoRouter.of(context).pop();
        //   },
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          height: heaight * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.shield_outlined),
                      Text(
                        ' Administrator Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: Assets.textfamily),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: heaight * 0.03,
                  ),
                  Text(
                    'full name',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.person,
                    hintText: 'Enter full name',
                    onchanged: (data) {
                      // price = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.mail_outline_outlined,
                    hintText: 'Enter email address',
                    onchanged: (data) {
                      // fees = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.lock_outline_rounded,
                    hintText: 'Enter Password',
                    onchanged: (data) {
                      // time = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Text(
                    'Confirm Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily),
                    textAlign: TextAlign.center,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.lock_outline_rounded,
                    hintText: 'Confirm Password',
                    onchanged: (data) {
                      // time = data;
                    },
                  ),
                  SizedBox(
                    height: heaight * 0.02,
                  ),
                  Text(
                    'Admin Role',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: Assets.textfamily),
                    textAlign: TextAlign.center,
                  ),
                  Adminroledropdown(
                      text: 'Selet admin role',
                      list: ['Super Admin', 'Admin'],
                      selectedPlate: 'Super Admin'),
                  SizedBox(
                    height: heaight * 0.03,
                  ),
                  Center(
                    child: CustomButton(
                      width: width,
                      heaight: heaight,
                      text: 'Add admin',
                      backcolor: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
