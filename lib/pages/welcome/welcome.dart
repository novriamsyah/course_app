import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/common/values/contant_value.dart';
import 'package:e_learning_app/global.dart';
import 'package:e_learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/welcome_event.dart';
import 'bloc/welcome_state.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 90.w),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _pageOnboarding(
                        context,
                        1,
                        "assets/images/reading.png",
                        "First See Learning",
                        "Forgot about a for of paper knowlage in on learning",
                        "Next",
                      ),
                      _pageOnboarding(
                        context,
                        2,
                        "assets/images/boy.png",
                        "Connect With Everyone",
                        "Always keep in touch with your tutor & friends, let's get connected!",
                        "Next",
                      ),
                      _pageOnboarding(
                        context,
                        3,
                        "assets/images/man.png",
                        "Always Fascinated Learning",
                        "Anywhare, Anytime. the time is at your dicretion on study whenever your want",
                        "Get started",
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page.toDouble(),
                      decorator: DotsDecorator(
                        color: kgrey,
                        activeColor: kBlue,
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _pageOnboarding(
    BuildContext context,
    int index,
    String imagePath,
    String title,
    String subTitle,
    String buttonName,
  ) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: popinsFont.copyWith(
              color: kblack,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          margin: EdgeInsets.only(top: 8.h),
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: popinsFont.copyWith(
              color: kgrey,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeIn,
              );
            } else {
              //set bool shared preferences
              GlobalApp.storageServices.setBool(
                  ConstanValueApp.STORAGE_DEVICE_OPEN_FIRST_TIME, true);
              //route ke login
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => false);
            }
          },
          child: Container(
            width: 325.w,
            height: 50.h,
            margin: EdgeInsets.only(
              top: 50.h,
              left: 25.w,
              right: 25.w,
            ),
            decoration: BoxDecoration(
              color: kBlue,
              borderRadius: BorderRadius.circular(15.w),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 1))
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: popinsFont.copyWith(
                  color: kWhite,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
