import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/login/bloc/login_blocs.dart';
import 'package:e_learning_app/pages/login/bloc/login_events.dart';
import 'package:e_learning_app/pages/login/bloc/login_states.dart';
import 'package:e_learning_app/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        color: kWhite,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: kWhite,
            appBar: buildAppbar("Log In"),
            body: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                SizedBox(height: 15.h),
                Center(
                  child: reusableText("Or use your email account to login",
                      kgrey, FontWeight.bold, 14.sp),
                ),
                Container(
                  margin: EdgeInsets.only(top: 65.h),
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText("Email", kblack.withOpacity(0.7),
                          FontWeight.normal, 14.sp),
                      SizedBox(height: 5.h),
                      buildTextField(
                        "Enter your email address",
                        "email",
                        "user",
                        (value) {
                          context.read<LoginBloc>().add(EmailEvent(value));
                        },
                      ),
                      reusableText("Password", kblack.withOpacity(0.7),
                          FontWeight.normal, 14.sp),
                      SizedBox(height: 5.h),
                      buildTextField(
                        "Enter your password",
                        "password",
                        "lock",
                        (value) {
                          context.read<LoginBloc>().add(PasswordEvent(value));
                        },
                      ),
                    ],
                  ),
                ),
                forgotPassword(),
                SizedBox(
                  height: 15.h,
                ),
                buildCustomButton(
                  "Log In",
                  "login",
                  () {
                    LoginController(context: context).handleLogin("email");
                  },
                ),
                buildCustomButton(
                  "Sign Up",
                  "register",
                  () {
                    Navigator.of(context).pushNamed("/register");
                  },
                ),
              ],
            )),
          ),
        ),
      );
    });
  }
}
