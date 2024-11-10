import 'dart:developer';

import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_events.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

import '../../../../core/styles/colors.dart';
import '../controller/authentication/authentication_bloc.dart';
import '../controller/authentication/authentication_states.dart';

class PhoneFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final Function? onSubmit;
  final ValueChanged<String>? onChange;
  final Function? onTap;
  final bool isPassword;
  final bool isValidate;
  final bool isLabel;
  final bool isBoarder;
  final Color? labelColor;
  final Function? validate;
  final String label;
  final bool isClickable;
  final double borderRadius;
  final double fontSize;
  final AutovalidateMode? autovalidateMode;
  final bool filled;
  final Color? fillColor;

  const PhoneFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.onSubmit,
    this.autovalidateMode,
    this.onChange,
    this.onTap,
    this.isPassword = false,
    this.isValidate = false,
    this.isLabel = false,
    this.isBoarder = false,
    this.labelColor,
    this.validate,
    required this.label,
    this.isClickable = true,
    this.borderRadius = 20.0,
    this.fontSize = 16.0,
    required this.filled,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        final AuthenticationBloc authenticationBloc=context.read<AuthenticationBloc>();
        return TextFormField(
          autovalidateMode: autovalidateMode,
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            filled: filled,
            fillColor: fillColor,
            labelText: isLabel ? label : null,
            hintText: authenticationBloc.state.phoneExample,
            hintStyle:  GoogleFonts.roboto().copyWith(
                color: labelColor ??  AppColor.shadedGrey, fontWeight: FontWeight.w400),
            labelStyle: TextStyle(
              color: labelColor ?? AppColor.indigoDye,
              fontFamily: 'cairo',
              fontWeight: FontWeight.bold,
            ),
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColor.grey.withOpacity(0.6),
                width: 1.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColor.roseMadder.withOpacity(0.6),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColor.green.withOpacity(0.6),
                width: 1.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide(
                color: AppColor.roseMadder.withOpacity(0.6),
                width: 1.0,
              ),
            ),
            prefixIcon: InkWell(
              onTap: () {
                showCountryPicker(
                  context: context,
                  countryListTheme: CountryListThemeData(
                    flagSize: 25,
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                        fontSize: 16, color: Colors.blueGrey),
                    bottomSheetHeight: 500,
                    // Optional. Country list modal height
                    //Optional. Sets the border radius for the bottomsheet.
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    //Optional. Styles the search field.
                    inputDecoration: InputDecoration(
                      labelText: 'Search',
                      hintText: 'Start typing to search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color(0xFF8C98A8).withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  onSelect: (Country country) {
                    log(
                        'Select country: ${country.displayName} , ${country.countryCode} , ${country.phoneCode} , ${country.e164Key} , ${country.e164Sc} , ${country.example}');
                    context.read<AuthenticationBloc>().add(
                      ChangeCountryEvent(
                          country.phoneCode, country.example),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Transform.rotate(
                      angle: -(90 * math.pi /180),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColor.grey.withOpacity(0.4),
                        size: 16.0,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        '+${authenticationBloc.state.phoneCode}',
                        style: GoogleFonts.roboto().copyWith(
                          color: AppColor.shadedGrey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      height: 35.0,
                      width: 1.5,
                      color: AppColor.grey.withOpacity(0.6),
                    ),
                  ],
                ),
              ),
            ),
          ),
          obscureText: isPassword,
          validator: (_) => isValidate ? validate!(_) : null,
          onFieldSubmitted: (_) => onSubmit!(_) ?? '',
        );
      },
    );
  }
}
