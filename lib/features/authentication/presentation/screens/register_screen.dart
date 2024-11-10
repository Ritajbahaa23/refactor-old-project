import 'dart:developer';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/core/utils/screen_args.dart';
import 'package:climatify/core/utils/screens.dart';
import 'package:climatify/features/authentication/presentation/components/register_button.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/shared/components/dynamic_form_field.dart';
import '../../../../core/styles/app_string.dart';
import '../components/phone_form_field.dart';
import '../controller/authentication/authentication_bloc.dart';
import '../controller/authentication/authentication_events.dart';
import '../controller/authentication/authentication_states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationStates>(
      listener: (context, state) {
        final AuthenticationBloc authenticationBloc =
            context.read<AuthenticationBloc>();
        if (state.registerState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.registerMessage,
                style: const TextStyle(color: AppColor.white),
              ),
              backgroundColor: AppColor.roseMadder,
            ),
          );
        }
        if (state.registerState == RequestState.loaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.registerMessage,
                style: const TextStyle(color: AppColor.white),
              ),
              backgroundColor: AppColor.green,
            ),
          );
          Navigator.pushNamed(
            context,
            Screens.emailVerifyScreen,
            arguments: ScreenArguments(
              'username',
              authenticationBloc.registerUsernameController.text,
              0,
            ),
          );
        }
      },
      builder: (context, state) {
        if (kDebugMode) {
          log('________________________ Register STATE $state _____________________________');
        }
        final AuthenticationBloc authenticationBloc =
            context.read<AuthenticationBloc>();
        return Scaffold(
          backgroundColor: AppColor.white,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: authenticationBloc.registerFormKey,
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
                    DynamicFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller:
                          authenticationBloc.registerFirstNameController,
                      type: TextInputType.text,
                      label: AppString.translate(
                        AppString.registerFirstNameLabel,
                        context,
                      ),
                      isLabel: true,
                      labelColor: AppColor.shadedGrey,
                      onSubmit: (v) {},
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter First Name';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DynamicFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authenticationBloc.registerLastNameController,
                      type: TextInputType.text,
                      label: AppString.translate(
                        AppString.registerLastNameLabel,
                        context,
                      ),
                      isLabel: true,
                      labelColor: AppColor.shadedGrey,
                      onSubmit: (v) {},
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Last Name';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DynamicFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authenticationBloc.registerEmailController,
                      type: TextInputType.emailAddress,
                      label: AppString.translate(
                        AppString.registerEmailLabel,
                        context,
                      ),
                      isLabel: true,
                      labelColor: AppColor.shadedGrey,
                      onSubmit: (v) {},
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Email';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DynamicFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authenticationBloc.registerUsernameController,
                      type: TextInputType.text,
                      label: AppString.translate(
                        AppString.registerUsernameLabel,
                        context,
                      ),
                      isLabel: true,
                      labelColor: AppColor.shadedGrey,
                      onSubmit: (v) {},
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Username';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    DynamicFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authenticationBloc.registerPasswordController,
                      type: TextInputType.visiblePassword,
                      label: AppString.translate(
                        AppString.registerPasswordLabel,
                        context,
                      ),
                      isLabel: true,
                      labelColor: AppColor.shadedGrey,
                      onSubmit: (v) {},
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isPassword: authenticationBloc.state.isPasswordOne,
                      suffixIcon: authenticationBloc.state.suffixOne,
                      suffixPressed: () {
                        authenticationBloc.add(SuffixEvent());
                      },
                      suffixIconColor: AppColor.shadedGrey.withOpacity(0.6),
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Password';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: InkWell(
                            onTap: () {
                              authenticationBloc
                                  .add(SelectDateTimeEvent(context));
                            },
                            child: DynamicFormField(
                              isValidate: true,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: authenticationBloc
                                  .registerDateOfBirthController,
                              type: TextInputType.datetime,
                              label: AppString.translate(
                                AppString.registerDateOfBirthLabel,
                                context,
                              ),
                              onChange: (value) {
                                print(value);
                              },
                              validate: (value) {
                                // if (value.toString().isEmpty) {
                                //   return 'Please Select Date';
                                // }
                              },
                              isLabel: false,
                              enabled: false,
                              hint: 'YYYY-MM-DD',
                              labelColor: AppColor.shadedGrey,
                              onSubmit: (v) {},
                              filled: true,
                              fillColor: AppColor.textFormFieldFilled,
                            ),
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.42,
                          child: DropdownSearch<String>(
                            autoValidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (authenticationBloc.gender.firstWhere(
                                    (element) => element == value,
                                    orElse: () => '',
                                  ) ==
                                  '') {
                                return 'Please Select gender';
                              }
                              return null;
                            },
                            // Directly use `dropdownDecoratorProps` if supported, otherwise use a similar approach
                          //   dropdownDecoratorProps: DropDownDecoratorProps(
                          //     dropdownSearchDecoration: InputDecoration(
                          //       filled: true,
                          //       fillColor: AppColor.textFormFieldFilled,
                          //       labelText: 'Gender',
                          //       labelStyle: GoogleFonts.roboto().copyWith(
                          //         color: AppColor.shadedGrey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //       alignLabelWithHint: true,
                          //       enabledBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //         borderSide: BorderSide(
                          //           color: AppColor.grey.withOpacity(0.6),
                          //           width: 1.0,
                          //         ),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //         borderSide: BorderSide(
                          //           color: AppColor.green.withOpacity(0.6),
                          //           width: 1.0,
                          //         ),
                          //       ),
                          //       errorBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //         borderSide: BorderSide(
                          //           color: AppColor.roseMadder.withOpacity(0.6),
                          //           width: 1.0,
                          //         ),
                          //       ),
                          //       focusedErrorBorder: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //         borderSide: BorderSide(
                          //           color: AppColor.roseMadder.withOpacity(0.6),
                          //           width: 1.0,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          //   items: authenticationBloc.gender,
                          //   onChanged: (value) {
                          //     authenticationBloc
                          //         .add(GenderChangeEvent(value.toString()));
                          //   },
                          //   onSaved: (value) {
                          //     authenticationBloc
                          //         .add(GenderChangeEvent(value.toString()));
                          //   },
                          //   popupProps: PopupProps.menu(
                          //     fit: FlexFit.loose,
                          //     menuProps: const MenuProps(
                          //       backgroundColor: Colors.transparent,
                          //       elevation: 0,
                          //     ),
                          //     containerBuilder: (ctx, popupWidget) {
                          //       return Column(
                          //         mainAxisSize: MainAxisSize.min,
                          //         crossAxisAlignment: CrossAxisAlignment.end,
                          //         children: [
                          //           Flexible(
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                 color: AppColor.textFormFieldFilled,
                          //                 borderRadius:
                          //                     BorderRadius.circular(12.0),
                          //               ),
                          //               child: popupWidget,
                          //             ),
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //     showSearchBox: false,
                          //     searchDelay: const Duration(milliseconds: 10),
                          //   ),
                          // ),
                        ),
                    )],
                    ),
                    // Row(
                    //   children: [
                    //     authenticationBloc
                    //             .registerDateOfBirthController.text.isEmpty
                    //         ? const
                    //     Text(
                    //             '*Please Select Date',
                    //             style: TextStyle(color: AppColor.roseMadder,fontSize: 12),
                    //           )
                    //         : const SizedBox(),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width * 0.18,
                    //     ),
                    //     authenticationBloc.state.selectedGender.isEmpty
                    //         ? const Text('*Please Select Gender',
                    //             style: TextStyle(color: AppColor.roseMadder,fontSize: 12))
                    //         : const SizedBox(),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PhoneFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: authenticationBloc.registerPhoneController,
                      type: TextInputType.phone,
                      onSubmit: (v) {},
                      label: AppString.translate(
                          AppString.registerPhoneLabel, context),
                      filled: true,
                      fillColor: AppColor.textFormFieldFilled,
                      isValidate: true,
                      validate: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Phone Number';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.42,
                        //   child: DropdownSearch<String>(
                        //     dropdownDecoratorProps: DropDownDecoratorProps(
                        //       dropdownSearchDecoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: AppColor.textFormFieldFilled,
                        //         labelText: 'Country',
                        //         labelStyle: GoogleFonts.roboto().copyWith(
                        //             color: AppColor.shadedGrey,
                        //             fontWeight: FontWeight.w400),
                        //         alignLabelWithHint: true,
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12.0),
                        //           borderSide: BorderSide(
                        //             color: AppColor.grey.withOpacity(0.6),
                        //             width: 1.0,
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12.0),
                        //           borderSide: BorderSide(
                        //             color: AppColor.green.withOpacity(0.6),
                        //             width: 1.0,
                        //           ),
                        //         ),
                        //       ),
                        //       baseStyle: GoogleFonts.roboto().copyWith(
                        //         color: AppColor.black,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 14.0,
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //     ),
                        //     // items: authenticationBloc.state.countriesList
                        //     //     .map(
                        //     //       (e) => e.name,
                        //     //     )
                        //     //     .toList(),
                        //     onChanged: (value) {
                        //       authenticationBloc.add(GetStatesByCodeEvent(
                        //           authenticationBloc
                        //               .state
                        //               .countriesList[authenticationBloc
                        //                   .state.countriesList
                        //                   .indexWhere((element) =>
                        //                       element.name == value)]
                        //               .isoCode));
                        //       authenticationBloc
                        //           .add(SetSelectedCountryEvent(value!));
                        //     },
                        //     onSaved: (value) {
                        //       authenticationBloc.add(GetStatesByCodeEvent(
                        //           authenticationBloc
                        //               .state
                        //               .countriesList[authenticationBloc
                        //                   .state.countriesList
                        //                   .indexWhere((element) =>
                        //                       element.name == value)]
                        //               .isoCode));
                        //       authenticationBloc
                        //           .add(SetSelectedCountryEvent(value!));
                        //     },
                        //     popupProps: PopupProps.menu(
                        //         fit: FlexFit.loose,
                        //         menuProps: const MenuProps(
                        //           backgroundColor: Colors.transparent,
                        //           elevation: 0,
                        //         ),
                        //         containerBuilder: (ctx, popupWidget) {
                        //           return Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             crossAxisAlignment: CrossAxisAlignment.end,
                        //             children: [
                        //               Flexible(
                        //                 child: Container(
                        //                   decoration: BoxDecoration(
                        //                     color: AppColor.textFormFieldFilled,
                        //                     borderRadius:
                        //                         BorderRadius.circular(12.0),
                        //                   ),
                        //                   child: popupWidget,
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         },
                        //         showSearchBox: true,
                        //         searchDelay: const Duration(milliseconds: 10)),
                        //   ),
                        // ),
                        const Spacer(),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.42,
                        //   child: DropdownSearch<String>(
                        //     dropdownDecoratorProps: DropDownDecoratorProps(
                        //       dropdownSearchDecoration: InputDecoration(
                        //         filled: true,
                        //         fillColor: AppColor.textFormFieldFilled,
                        //         labelText: 'State',
                        //         labelStyle: GoogleFonts.roboto().copyWith(
                        //             color: AppColor.shadedGrey,
                        //             fontWeight: FontWeight.w400),
                        //         alignLabelWithHint: true,
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12.0),
                        //           borderSide: BorderSide(
                        //             color: AppColor.grey.withOpacity(0.6),
                        //             width: 1.0,
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(12.0),
                        //           borderSide: BorderSide(
                        //             color: AppColor.green.withOpacity(0.6),
                        //             width: 1.0,
                        //           ),
                        //         ),
                        //       ),
                        //       baseStyle: GoogleFonts.roboto().copyWith(
                        //         color: AppColor.black,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 14.0,
                        //         overflow: TextOverflow.ellipsis,
                        //       ),
                        //     ),
                        //     items: authenticationBloc.state.statesList
                        //         .map(
                        //           (e) => e.name,
                        //         )
                        //         .toList(),
                        //     onChanged: (value) {
                        //       authenticationBloc.add(GetCityByCodeEvent(
                        //           authenticationBloc
                        //               .state
                        //               .countriesList[authenticationBloc
                        //                   .state.countriesList
                        //                   .indexWhere((element) =>
                        //                       element.name ==
                        //                       authenticationBloc
                        //                           .state.selectedCountry)]
                        //               .isoCode,
                        //           authenticationBloc
                        //               .state
                        //               .statesList[authenticationBloc
                        //                   .state.statesList
                        //                   .indexWhere((element) =>
                        //                       element.name == value)]
                        //               .isoCode));
                        //       authenticationBloc
                        //           .add(SetSelectedStateEvent(value!));
                        //     },
                        //     onSaved: (value) {
                        //       authenticationBloc.add(GetCityByCodeEvent(
                        //           authenticationBloc
                        //               .state
                        //               .countriesList[authenticationBloc
                        //                   .state.countriesList
                        //                   .indexWhere((element) =>
                        //                       element.name == value)]
                        //               .isoCode,
                        //           authenticationBloc
                        //               .state
                        //               .statesList[authenticationBloc
                        //                   .state.statesList
                        //                   .indexWhere((element) =>
                        //                       element.name == value)]
                        //               .isoCode));
                        //       authenticationBloc
                        //           .add(SetSelectedStateEvent(value!));
                        //     },
                        //     popupProps: PopupProps.menu(
                        //         fit: FlexFit.loose,
                        //         menuProps: const MenuProps(
                        //           backgroundColor: Colors.transparent,
                        //           elevation: 0,
                        //         ),
                        //         containerBuilder: (ctx, popupWidget) {
                        //           return Column(
                        //             mainAxisSize: MainAxisSize.min,
                        //             crossAxisAlignment: CrossAxisAlignment.end,
                        //             children: [
                        //               Flexible(
                        //                 child: Container(
                        //                   decoration: BoxDecoration(
                        //                     color: AppColor.textFormFieldFilled,
                        //                     borderRadius:
                        //                         BorderRadius.circular(12.0),
                        //                   ),
                        //                   child: popupWidget,
                        //                 ),
                        //               ),
                        //             ],
                        //           );
                        //         },
                        //         showSearchBox: true,
                        //         searchDelay: const Duration(milliseconds: 10)),
                        //   ),
                        // ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     authenticationBloc.state.selectedCountry.isEmpty
                    //         ? const Text(
                    //             '*Please Select Country',
                    //             style: TextStyle(color: AppColor.roseMadder,fontSize: 12),
                    //           )
                    //         : const SizedBox(),
                    //     SizedBox(
                    //       width: MediaQuery.of(context).size.width * 0.13,
                    //     ),
                    //     authenticationBloc.state.selectedState.isEmpty
                    //         ? const Text('*Please Select State',
                    //             style: TextStyle(color: AppColor.roseMadder,fontSize: 12))
                    //         : const SizedBox(),
                    //   ],
                    // ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // DropdownSearch<String>(
                    //   items: authenticationBloc.state.citiesList
                    //       .map((e) => e.name)
                    //       .toList(),
                    //   autoValidateMode: AutovalidateMode.onUserInteraction,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please select a city';
                    //     }
                    //     return null;
                    //   },
                    //   onChanged: (value) {
                    //     if (value != null) {
                    //       authenticationBloc.add(SetSelectedCityEvent(value));
                    //     }
                    //   },
                    //   onSaved: (value) {
                    //     if (value != null) {
                    //       authenticationBloc.add(SetSelectedCityEvent(value));
                    //     }
                    //   },
                    //   dropdownDecoratorProps: DropDownDecoratorProps(
                    //     // Use if available
                    //     dropdownSearchDecoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: AppColor.textFormFieldFilled,
                    //       labelText: 'City',
                    //       labelStyle: GoogleFonts.roboto().copyWith(
                    //         color: AppColor.shadedGrey,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12.0),
                    //         borderSide: BorderSide(
                    //           color: AppColor.grey.withOpacity(0.6),
                    //           width: 1.0,
                    //         ),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(12.0),
                    //         borderSide: BorderSide(
                    //           color: AppColor.green.withOpacity(0.6),
                    //           width: 1.0,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //   popupProps: PopupProps.menu(
                    //     fit: FlexFit.loose,
                    //     showSearchBox: true,
                    //     menuProps: const MenuProps(
                    //       backgroundColor: Colors.transparent,
                    //       elevation: 0,
                    //     ),
                    //     containerBuilder: (ctx, popupWidget) {
                    //       return Column(
                    //         mainAxisSize: MainAxisSize.min,
                    //         crossAxisAlignment: CrossAxisAlignment.end,
                    //         children: [
                    //           Flexible(
                    //             child: Container(
                    //               decoration: BoxDecoration(
                    //                 color: AppColor.textFormFieldFilled,
                    //                 borderRadius: BorderRadius.circular(12.0),
                    //               ),
                    //               child: popupWidget,
                    //             ),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),

                    Row(
                      children: [
                        authenticationBloc.state.selectedCity.isEmpty &&
                                authenticationBloc.state.isSignUpPresses == true
                            ? const Text(
                                '*Please Select City',
                                style: TextStyle(
                                    color: AppColor.roseMadder, fontSize: 12),
                              )
                            : const SizedBox(),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 50,
                      child: Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'By Registeration, you agree to our ',
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
                                    color: AppColor.basicColor,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, Screens.termsScreen);
                                    print('Button tapped');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const RegisterButton(),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
