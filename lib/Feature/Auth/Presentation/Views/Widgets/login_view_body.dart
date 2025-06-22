import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify_admin/Core/utlis/App_Router.dart';
import 'package:parkify_admin/Core/utlis/CustomButton.dart';
import 'package:parkify_admin/Core/utlis/CustomTextField.dart';
import 'package:parkify_admin/Core/utlis/Function/CustomScaffoldMessenger.dart';
import 'package:parkify_admin/Core/utlis/Valdiater.dart';
import 'package:parkify_admin/Core/utlis/assets.dart';
import 'package:parkify_admin/Feature/Auth/Presentation/View_Model/cubit/admin_login_to_account_cubit.dart';
import 'package:parkify_admin/Feature/Auth/Presentation/Views/Widgets/LogoinenteryImage.dart';
import 'package:parkify_admin/constant.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  String? email;
  String? password;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AdminLoginToAccountCubit, AdminLoginToAccountState>(
      listener: (context, state) {
        if (state is AdminLoginToAccountFailure) {
          CustomScaffoldMessenger(
            context,
            "Error is : ${state.errmessage}",
            FontAwesomeIcons.circleXmark,
          );
        } else if (state is AdminLoginToAccountSuccess) {
          CustomScaffoldMessenger(
              context, 'Success', Icons.check_circle_outline);
          GoRouter.of(context)
              .push(AppRouter.Adminpanelviews, extra: state.admin.token);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kprimaryColor,
          body: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: heaight * 0.08,
                ),
                LogoinenteryImage(width: width, heaight: heaight),
                SizedBox(
                  height: heaight * 0.08,
                ),
                Expanded(
                  child: Container(
                    width: width,
                    height: heaight * 0.7,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16.0, right: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: heaight * 0.02),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontFamily: Assets.textfamily,
                                fontSize: 28,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: heaight * 0.05),
                            CustomTextField(
                              hintText: 'User Name',
                              prefixIcon: Icons.person,
                              onchanged: (data) {
                                email = data;
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email like  ......@org.com';
                                }
                                if (!valdiate().valdiateemail(email: email) ||
                                    !valdiate().valdiateemail(email: email)) {
                                  return 'Please enter a valid email';
                                }
                              },
                            ),
                            SizedBox(height: heaight * 0.05),
                            CustomTextField(
                              hintText: 'PassWord',
                              prefixIcon: Icons.lock_rounded,
                              obscureText: true,
                              suffixIcon: Icons.remove_red_eye_rounded,
                              onchanged: (data) {
                                password = data;
                              },
                              valdiate: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please  Enter your password';
                                }
                                if (!valdiate()
                                        .valdiatepassword(password: password) ||
                                    !valdiate()
                                        .valdiatepassword(password: password)) {
                                  return 'It must contain at least one uppercase letter (e.g., A, B, C...)\nIt must contain at least one lowercase letter (e.g., a, b, c...) \nIt must contain at least one number (e.g., 0, 1, 2...).\nIt must contain at least one special character (e.g., !, @, #, &, *, ~).\nIt must be at least 8 characters long';
                                }
                              },
                            ),
                            SizedBox(height: heaight * 0.05),
                            Center(
                              child: state is AdminLoginToAccountLoading
                                  ? const SpinKitFadingCircle(
                                      color: Colors.black,
                                    )
                                  : CustomButton(
                                      width: width,
                                      heaight: heaight,
                                      text: 'Login',
                                      onPressed: () {
                                        if (formkey.currentState!.validate()) {
                                          context
                                              .read<AdminLoginToAccountCubit>()
                                              .AdminLogin(
                                                  email: email!,
                                                  password: password!);
                                        }
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
