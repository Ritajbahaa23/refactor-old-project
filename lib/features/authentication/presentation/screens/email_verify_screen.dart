import 'dart:developer';

import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/features/authentication/presentation/components/editable_mail_widget.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/shared/components/back_button.dart';
import '../../../../core/shared/components/custom_app_bar.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/screen_args.dart';
import '../../../../core/utils/screens.dart';
import '../controller/authentication/authentication_events.dart';
import '../controller/authentication/authentication_states.dart';

class EmailVerifyScreen extends StatelessWidget {
  const EmailVerifyScreen({super.key, required this.arguments});

  final ScreenArguments? arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {
          if (state.verifyCodeState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.verifyCodeMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.roseMadder,
              ),
            );
          }
          if (state.verifyCodeState == RequestState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.verifyCodeMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.green,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              Screens.verifySuccessScreen,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          log('________________________ EmailVerifyScreen STATE $state _____________________________');
          final AuthenticationBloc authenticationBloc =
              context.read<AuthenticationBloc>();

          return Scaffold(
            appBar: const CustomAppBar(
                appBarWidget: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                children: [
                  BackButtonWidget(
                    direction: true,
                  )
                ],
              ),
            )),
            body: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 23.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 23.0,
                      ),
                      Image.asset(
                        'assets/images/verify_email.png',
                        width: MediaQuery.sizeOf(context).width,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Verify your email',
                        style: GoogleFonts.poppins().copyWith(
                            color: AppColor.black,
                            fontSize: 18.36,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15.88,
                      ),
                      Align(
                        alignment: AlignmentDirectional.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Kindly input the code was sent to your email',
                                style: GoogleFonts.inter().copyWith(
                                    color: AppColor.black,
                                    fontSize: 14.68,
                                    fontWeight: FontWeight.w500),
                              ),
                              TextSpan(
                                text: '\n address for confirmation',
                                style: GoogleFonts.inter().copyWith(
                                    color: AppColor.black,
                                    fontSize: 14.68,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 33.93,
                      ),
                      EditableEmailField(),
                      const SizedBox(
                        height: 33.93,
                      ),
                      OtpTextField(
                        mainAxisAlignment: MainAxisAlignment.center,
                        borderRadius: BorderRadius.circular(11.0),
                        numberOfFields: 6,
                        borderColor: AppColor.grey100,
                        borderWidth: 1.84,
                        keyboardType: TextInputType.number,
                        enabledBorderColor: AppColor.grey100,
                        disabledBorderColor: AppColor.grey100,
                        showFieldAsBox: true,
                        fieldHeight: MediaQuery.sizeOf(context).height * .08,
                        fieldWidth: MediaQuery.sizeOf(context).width * .12,
                        focusedBorderColor: AppColor.basicColor.withOpacity(0.6),
                        onSubmit: (value) {
                          log(value.toString());
                          authenticationBloc.add(ChangeVerifyCodeEvent(value));
                          authenticationBloc.add(VerifyCodeEvent(
                              value, arguments!.message.toString()));
                        },
                        autoFocus: true,
                      ),
                      const SizedBox(
                        height: 23.56,
                      ),

                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: 'Didn’t receive any code?',
                          style: GoogleFonts.poppins().copyWith(
                              color: AppColor.basicColor,
                              fontSize: 14.68,
                              fontWeight: FontWeight.w600),
                        ),
                        // TextSpan(
                        //   text: '\nResend OTP in 0:23s',
                        //   style: GoogleFonts.poppins().copyWith(
                        //       color: AppColor.black,
                        //       fontSize: 14.68,
                        //       fontWeight: FontWeight.w500),
                        //   recognizer: TapGestureRecognizer()
                        //     ..onTap = () {
                        //       log("TextSpan is clicked.");
                        //       authenticationBloc.add(ResendVerifyCodeEvent(
                        //           arguments!.message.toString()));
                        //     },
                        // ),
                      ])),
                      SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.sizeOf(context).width*.8,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextButton(
                            onPressed: () {
                              log("TextSpan is clicked.");
                              authenticationBloc.add(ResendVerifyCodeEvent(
                                  arguments!.message.toString()));
                            },
                            child: Text(
                              'Resend OTP in 0:23s',
                              style: GoogleFonts.poppins().copyWith(
                                  color: AppColor.black,
                                  fontSize: 14.68,
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                      const SizedBox(
                        height: 23.56,
                      ),
                      switch (authenticationBloc.state.verifyCodeState) {
                        RequestState.initial => InkWell(
                            onTap: () {
                              authenticationBloc.add(
                                VerifyCodeEvent(
                                    authenticationBloc.state.verifyCode,
                                    arguments!.message.toString()),
                              );
                            },
                            child: Container(
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.basicColor,
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: Center(
                                child: Text(
                                  AppString.translate(
                                      AppString.registerVerifyCodeButton,
                                      context),
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                        RequestState.loading => const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.basicColor,
                            ),
                          ),
                        RequestState.loaded => InkWell(
                            onTap: () {
                              authenticationBloc.add(
                                VerifyCodeEvent(
                                    authenticationBloc.state.verifyCode,
                                    arguments!.message.toString()),
                              );
                            },
                            child: Container(
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.basicColor,
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: Center(
                                child: Text(
                                  AppString.translate(
                                      AppString.registerVerifyCodeButton,
                                      context),
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                        RequestState.error => InkWell(
                            onTap: () {
                              authenticationBloc.add(
                                VerifyCodeEvent(
                                    authenticationBloc.state.verifyCode,
                                    arguments!.message.toString()),
                              );
                            },
                            child: Container(
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColor.basicColor,
                                borderRadius: BorderRadius.circular(11.0),
                              ),
                              child: Center(
                                child: Text(
                                  AppString.translate(
                                      AppString.registerVerifyCodeButton,
                                      context),
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                      },
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
