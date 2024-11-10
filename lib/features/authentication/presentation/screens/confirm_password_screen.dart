import 'dart:developer';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/services/services_locator.dart';
import '../../../../core/shared/components/back_button.dart';
import '../../../../core/shared/components/custom_app_bar.dart';
import '../../../../core/shared/components/dynamic_form_field.dart';
import '../../../../core/styles/app_string.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/utils/screen_args.dart';
import '../../../../core/utils/screens.dart';
import '../controller/authentication/authentication_events.dart';
import '../controller/authentication/authentication_states.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  const ConfirmPasswordScreen({super.key, required this.arguments});

  final ScreenArguments? arguments;

  @override
  Widget build(BuildContext context) {
    var controller=TextEditingController();
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {
          if (state.confirmForgetPasswordState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.confirmForgetPasswordMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.roseMadder,
              ),
            );
          }
          if (state.confirmForgetPasswordState == RequestState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.confirmForgetPasswordMessage,
                  style: const TextStyle(color: AppColor.white),
                ),
                backgroundColor: AppColor.green,
              ),
            );
            Navigator.pushNamed(
              context,
              Screens.verify_reset,
            );
          }
        },
        builder: (context, state) {
          log('________________________ ConfirmPasswordScreen STATE $state _____________________________');
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23.0),
                child: Form(
                  key: authenticationBloc.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 23.0,
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Set a new password',
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
                                    'Create a new password. Ensure it differs from\nprevious ones for security',
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
                        fieldHeight: MediaQuery.sizeOf(context).height*.08,
                        fieldWidth: MediaQuery.sizeOf(context).width*.12,
                        focusedBorderColor:
                            AppColor.basicColor.withOpacity(0.6),
                        onSubmit: (value) {
                          log("This is onSubmit:${value.toString()}");
                          log(arguments!.message.toString());
                          if (authenticationBloc.formKey.currentState!
                              .validate()) {
                            log("This otp:${value.toString()}");
                            authenticationBloc
                                .add(ChangeConfirmCodeEvent(value.toString()));
                          }
                          // authenticationBloc.add(ChangeVerifyCodeEvent(value));
                          // authenticationBloc.add(VerifyCodeEvent(
                          //     value, arguments!.message.toString()));
                        },
                        autoFocus: true,
                      ),
                      const SizedBox(
                        height: 23.56,
                      ),
                      Text("Password",style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicFormField(
                        hint: "Enter your new password",
                        controller:
                            authenticationBloc.forgetPasswordPasswordController,
                        type: TextInputType.visiblePassword,
                        label: AppString.translate(
                            AppString.loginPasswordLabel, context),
                        isLabel: false,
                        labelColor: AppColor.shadedGrey.withOpacity(0.4),
                        enabledborderColor: AppColor.basicColor,
                        onSubmit: (v) {},
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
                      Text("Confirm Password",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      const SizedBox(
                        height: 10,
                      ),
                      DynamicFormField(
                        hint: "Re-enter password",
                        controller:controller,
                        type: TextInputType.visiblePassword,
                        label: AppString.translate(
                            AppString.loginPasswordLabel, context),
                        isLabel: false,
                        labelColor: AppColor.shadedGrey.withOpacity(0.4),
                        enabledborderColor: AppColor.basicColor,
                        onSubmit: (v) {},
                        isPassword: authenticationBloc.state.isPasswordTwo,
                        suffixIcon: authenticationBloc.state.suffixOne,
                        suffixPressed: () {
                          authenticationBloc.add(SuffixTwoEvent());
                        },
                        suffixIconColor: AppColor.shadedGrey.withOpacity(0.4),
                        isValidate: true,
                        validate: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please Re-Enter Password';
                          }
                          else if(controller.text!=authenticationBloc.forgetPasswordPasswordController.text){
                            return "Password don\'t match";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 23.88,
                      ),
                      switch (
                          authenticationBloc.state.confirmForgetPasswordState) {
                        RequestState.initial => InkWell(
                            onTap: () {
                              if (authenticationBloc.formKey.currentState!
                                  .validate()) {
                                authenticationBloc.add(
                                  ConfirmForgetPasswordEvent(
                                    arguments!.message.toString(),
                                  ),
                                );
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
                                  'Update Password',
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
                              if (authenticationBloc.formKey.currentState!
                                  .validate()) {
                                authenticationBloc.add(
                                  ConfirmForgetPasswordEvent(
                                    arguments!.message.toString(),
                                  ),
                                );
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
                                  'Update Password',
                                  style: AppStringStyles.signupButtonStyle,
                                ),
                              ),
                            ),
                          ),
                        RequestState.error => InkWell(
                            onTap: () {
                              if (authenticationBloc.formKey.currentState!
                                  .validate()) {
                                authenticationBloc.add(
                                  ConfirmForgetPasswordEvent(
                                    arguments!.message.toString(),
                                  ),
                                );
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
                                  'Update Password',
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
