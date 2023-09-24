import 'package:booky_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      required this.borderRadius});

  final Color backgroundColor;
  final Color textColor;
  final String text;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.4,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            )),
        child: Text(
          text,
          style: TextStyles.textStyle16
              .copyWith(color: textColor, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
