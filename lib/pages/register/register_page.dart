import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/register/bloc/register_blocs.dart';
import 'package:e_learning_app/pages/register/bloc/register_events.dart';
import 'package:e_learning_app/pages/register/bloc/register_states.dart';
import 'package:e_learning_app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/widgets/index.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return Container(
        color: kWhite,
        child: SafeArea(
          child: Scaffold(
            appBar: buildAppbar("Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  Center(
                    child: reusableText(
                        "Enter your detail below & free sign up",
                        kgrey,
                        FontWeight.normal,
                        14.sp),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60.h),
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText("Username", kblack.withOpacity(0.7),
                            FontWeight.normal, 14.sp),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your username",
                          "username",
                          "user",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(UsernameEvent(value));
                          },
                        ),
                        SizedBox(height: 5.h),
                        reusableText("Email", kblack.withOpacity(0.7),
                            FontWeight.normal, 14.sp),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your email address",
                          "email",
                          "user",
                          (value) {
                            context.read<RegisterBloc>().add(EmailEvent(value));
                          },
                        ),
                        SizedBox(height: 5.h),
                        reusableText("Password", kblack.withOpacity(0.7),
                            FontWeight.normal, 14.sp),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your password",
                          "password",
                          "lock",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordEvent(value));
                          },
                        ),
                        SizedBox(height: 5.h),
                        reusableText("Confirm Password",
                            kblack.withOpacity(0.7), FontWeight.normal, 14.sp),
                        SizedBox(height: 5.h),
                        buildTextField(
                          "Enter your comfirm password",
                          "password",
                          "lock",
                          (value) {
                            context
                                .read<RegisterBloc>()
                                .add(RePasswordEvent(value));
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: reusableText(
                        "By creating an account you have to agree with our them & condication",
                        kgrey,
                        FontWeight.normal,
                        12.sp),
                  ),
                  SizedBox(height: 20.h),
                  buildCustomButton(
                    "Sign Up",
                    "login",
                    () {
                      RegisterController(context: context).handleRegisterUser();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
