import 'package:e_learning_app/common/values/constant.dart';
import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    super.key,
    required this.textValue,
    this.color = Colors.black,
    this.sizeText = 24.0,
    this.marginTop = 0.0,
    this.marginRight = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
  });

  final String textValue;
  final Color color;
  final double sizeText;
  final double marginTop;
  final double marginRight;
  final double marginBottom;
  final double marginLeft;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: marginTop,
          right: marginRight,
          bottom: marginBottom,
          left: marginLeft),
      child: Text(
        textValue,
        style: popinsFont.copyWith(
          color: color,
          fontSize: sizeText,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
