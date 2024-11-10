import 'dart:developer';

import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/core/utils/screens.dart';
import 'package:climatify/features/authentication/presentation/components/signin_button_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/shared/components/dynamic_form_field.dart';
import '../../../../generated/assets.dart';
import '../controller/authentication/authentication_bloc.dart';
import '../controller/authentication/authentication_events.dart';
import '../controller/authentication/authentication_states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<AuthenticationBloc>(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {
          final AuthenticationBloc authenticationBloc =
              context.read<AuthenticationBloc>();
          if (authenticationBloc.state.loginState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    authenticationBloc.state.loginMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins().copyWith(
                        color: AppColor.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                backgroundColor: AppColor.roseMadder,
              ),
            );
          }
          if (authenticationBloc.state.loginState == RequestState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Center(
                  child: Text(
                    authenticationBloc.state.loginMessage,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins().copyWith(
                        color: AppColor.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                backgroundColor: AppColor.green,
              ),
            );
            Navigator.pushNamed(context, Screens.homeLayout);
          }
        },
        builder: (context, state) {
          if (kDebugMode) {
            log('________________LOGIN SCREEN STATE__________________$state');
          }
          final AuthenticationBloc authenticationBloc =
              context.read<AuthenticationBloc>();

          return Scaffold(
            backgroundColor: AppColor.white,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: authenticationBloc.formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          AppString.translate(
                              AppString.welcomeToClimatify, context),
                          style: AppStringStyles.welcomeStyle,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Image(
                          image: AssetImage(
                            Assets.imagesClimitifyImg1,
                          ),
                          height: 200.0,
                          width: 200.0,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        DynamicFormField(
                          controller: authenticationBloc.loginEmailController,
                          type: TextInputType.emailAddress,
                          label: AppString.translate(
                            AppString.loginEmailLabel,
                            context,
                          ),
                          isLabel: true,
                          labelColor: AppColor.shadedGrey.withOpacity(0.4),
                          enabledborderColor: AppColor.basicColor,
                          onSubmit: (v) {},
                          isValidate: true,
                          validate: (value) {
                            if (value.toString().isEmpty) {
                              return 'Please Enter Email/Username';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        DynamicFormField(
                          controller:
                              authenticationBloc.loginPasswordController,
                          type: TextInputType.visiblePassword,
                          label: AppString.translate(
                              AppString.loginPasswordLabel, context),
                          isLabel: true,
                          labelColor: AppColor.shadedGrey.withOpacity(0.4),
                          enabledborderColor: AppColor.basicColor,
                          onSubmit: (v) {
                            if (authenticationBloc.formKey.currentState!
                                .validate()) {
                              authenticationBloc.add(LoginEvent());
                            }
                          },
                          isPassword: authenticationBloc.state.isPasswordOne,
                          suffixIcon: authenticationBloc.state.suffixOne,
                          suffixPressed: () {
                            authenticationBloc.add(SuffixEvent());
                          },
                          suffixIconColor: AppColor.shadedGrey.withOpacity(0.4),
                          isValidate: true,
                          validate: (value) {
                            if (value.toString().isEmpty) {
                              return 'Please Enter Password';
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Screens.forgetPasswordScreen,
                              );
                            },
                            child: Text(
                              AppString.translate(
                                  AppString.doYouForgetPasswordButton, context),
                              style: AppStringStyles
                                  .doYouForgetPasswordButtonStyle,
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 50,
                          child: Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: 'By logging in, you agree to our ',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,

                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Terms and Conditions.',

                                    style: TextStyle(
                                      fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        color:AppColor.basicColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                          context,
                                          Screens.termsScreen,

                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SignInButtonBuilder(),
                        const SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
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
