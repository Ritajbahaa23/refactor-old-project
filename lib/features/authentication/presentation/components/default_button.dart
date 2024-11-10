import 'package:climatify/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/styles/app_string.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({super.key, required this.text, required this.onTap});
final String text;
final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.basicColor,
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Center(
          child: Text(
            text,
            style: AppStringStyles.signupButtonStyle,
          ),
        ),
      ),
    );
  }
}
