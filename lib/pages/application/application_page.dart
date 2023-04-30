import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/application/bloc/application_blocs.dart';
import 'package:e_learning_app/pages/application/bloc/application_events.dart';
import 'package:e_learning_app/pages/application/bloc/application_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/application_widgets.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
        builder: (context, state) {
      return Container(
        color: kWhite,
        child: SafeArea(
          child: Scaffold(
            body: builPage(state.index),
            bottomNavigationBar: Container(
              width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                color: kPurpleBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.h),
                  topRight: Radius.circular(20.h),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kgrey.withOpacity(0.1),
                    spreadRadius: 1,
                    offset: const Offset(0, -1),
                    blurRadius: 3,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (value) {
                  context.read<ApplicationBloc>().add(TriggerPageEvent(value));
                },
                elevation: 0,
                backgroundColor: kWhite,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedItemColor: kPurpleBlue,
                unselectedItemColor: kgrey,
                items: bottomNavItem, //this widget clean
              ),
            ),
          ),
        ),
      );
    });
  }
}
