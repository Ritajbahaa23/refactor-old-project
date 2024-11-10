import 'dart:developer';

import 'package:climatify/core/shared/components/dynamic_form_field.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/shared/components/back_button.dart';
import '../../../../core/shared/components/custom_app_bar.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/screen_args.dart';
import '../../../../core/utils/screens.dart';
import '../controller/authentication/authentication_states.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {
          final AuthenticationBloc authenticationBloc =
              context.read<AuthenticationBloc>();
          if (state.forgetPasswordState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.forgetPasswordMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.roseMadder,
              ),
            );
          }
          if (state.forgetPasswordState == RequestState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.forgetPasswordMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.green,
              ),
            );
            Navigator.pushNamed(
              context,
              Screens.confirmForgetPasswordScreen,
              arguments: ScreenArguments(
                'email',
                authenticationBloc.forgetPasswordEmailController.text,
                0,
              ),
            );
          }
        },
        builder: (context, state) {
          log('________________________ Register STATE $state _____________________________');
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
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Form(
                  key: authenticationBloc.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 23.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Forgot password',
                          style: GoogleFonts.poppins().copyWith(
                              color: AppColor.black,
                              fontSize: 18.36,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 15.88,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'Please enter your email to reset the password',
                                style: GoogleFonts.inter().copyWith(
                                    color: AppColor.grey.withOpacity(0.6),
                                    fontSize: 14.68,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 26.89,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Your Email',
                          style: GoogleFonts.inter().copyWith(
                              color: AppColor.black,
                              fontSize: 14.68,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 6.7,
                      ),
                      DynamicFormField(
                        controller:
                            authenticationBloc.forgetPasswordEmailController,
                        type: TextInputType.emailAddress,
                        onSubmit: () {},
                        label: AppString.translate(
                            AppString.registerEmailLabel, context),
                        hint: 'Enter your email',
                        isValidate: true,
                        labelColor: Colors.grey,
                        validate: (value){
                          if(value.toString().isEmpty){
                            return 'Please Enter Email';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 23.88,
                      ),
                      switch (authenticationBloc.state.forgetPasswordState) {
                        RequestState.initial => InkWell(
                            onTap: () {
                              if(authenticationBloc.formKey.currentState!.validate()) {
                                authenticationBloc.add(ForgetPasswordEvent());
                              }
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
                                  'Reset Password',
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
                              if(authenticationBloc.formKey.currentState!.validate()) {
                                authenticationBloc.add(ForgetPasswordEvent());
                              }
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
                                  'Reset Password',
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                        RequestState.error => InkWell(
                            onTap: () {
                              if(authenticationBloc.formKey.currentState!.validate()) {
                                authenticationBloc.add(ForgetPasswordEvent());
                              }
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
                                  'Reset Password',
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                      }
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
