import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/home/bloc/home_blocs.dart';
import 'package:e_learning_app/pages/home/bloc/home_states.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhite,
          appBar: buildAppbar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.sp),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: WelcomeText(
                    textValue: "Hello!",
                    color: kgrey,
                    sizeText: 24.sp,
                    marginLeft: 2.w,
                    marginTop: 22.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: WelcomeText(
                    textValue: "Amsyah",
                    sizeText: 24.sp,
                    marginLeft: 2.w,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomSearchSection(
                    marginTop: 20.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomSliderContainer(
                    context: context,
                    state: state,
                  ),
                ),
                SliverToBoxAdapter(
                  child: HeaderTitle(
                    marginTop: 25.h,
                    title: "Choose your course",
                    secondTitle: "See all",
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomMenuButton(
                    marginTop: 20.h,
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1.5,
                    ),
                    delegate: SliverChildBuilderDelegate(childCount: 4,
                        (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: const CustomGridContent(),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
