import 'package:climatify/core/shared/components/back_button.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/shared/components/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: CustomAppBar(
          appBarWidget: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: BackButtonWidget(
                direction: true,
              ),
            ),
            Center(
              child: Text(
                'Terms',
                style: TextStyle(
                  color: AppColor.basicColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * .04),
              child: Text(
                AppString.termsTitle,
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Text(
              AppString.termsDescription1,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: height*.03),
            Text(
              AppString.termsDescription2,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
