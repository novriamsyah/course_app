import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/home/bloc/home_blocs.dart';
import 'package:e_learning_app/pages/home/bloc/home_events.dart';
import 'package:e_learning_app/pages/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliderContainer extends StatelessWidget {
  const CustomSliderContainer({
    super.key,
    required this.context,
    required this.state,
  });

  final BuildContext context;
  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 325.w,
          height: 170.h,
          margin: EdgeInsets.only(top: 25.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: PageView(
            onPageChanged: (value) {
              context.read<HomeBloc>().add(HomeDotIndicatorEvent(value));
            },
            children: const [
              _ContainerContentSlider(imageurl: "assets/icons/art.png"),
              _ContainerContentSlider(imageurl: "assets/icons/Image_2.png"),
              _ContainerContentSlider(imageurl: "assets/icons/Image_1.png"),
            ],
          ),
        ),
        SizedBox(
          child: DotsIndicator(
            dotsCount: 3,
            position: state.index.toDouble(),
            decorator: DotsDecorator(
              color: kgrey,
              activeColor: kBlue,
              size: const Size.square(6.0),
              activeSize: const Size(18.0, 5.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContainerContentSlider extends StatelessWidget {
  const _ContainerContentSlider({
    Key? key,
    required this.imageurl,
  }) : super(key: key);
  final String imageurl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      height: 170.h,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageurl),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
