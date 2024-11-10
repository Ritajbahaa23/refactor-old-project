import 'package:climatify/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicFormField extends StatelessWidget {
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
  final Color? borderColor;
  final Color? enabledborderColor;
  final Function? validate;
  final String label;
  final String? hint;
  final IconData? prefix;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  final Function? suffixPressed;
  final bool isClickable;
  final double borderRadius;
  final double fontSize;
  final bool filled;
  final bool enabled;
  final Color? fillColor;
  final AutovalidateMode? autovalidateMode;

  const DynamicFormField({
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
    this.enabled = true,
    this.labelColor,
    this.borderColor,
    this.validate,
    required this.label,
    this.prefix,
    this.suffixIcon,
    this.suffixIconColor,
    this.suffixPressed,
    this.isClickable = true,
    this.borderRadius = 20.0,
    this.fontSize = 16.0,
    this.filled = false,
    this.fillColor,
    this.hint,
    this.enabledborderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      controller: controller,
      keyboardType: type,
      enabled: enabled,
      decoration: InputDecoration(
        filled: filled,
        fillColor: fillColor,
        labelText: isLabel ? label : null,
        labelStyle: GoogleFonts.roboto().copyWith(
            color: labelColor ?? AppColor.black, fontWeight: FontWeight.w400),
        alignLabelWithHint: false,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.grey.withOpacity(0.6),
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: borderColor ?? AppColor.grey.withOpacity(0.6),
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
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: AppColor.roseMadder.withOpacity(0.6),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: enabledborderColor ?? AppColor.basicColor,
            width: 1.0,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: () => suffixPressed!(),
          icon: Icon(
            suffixIcon,
            color: suffixIconColor,
          ),
        ),
        hintText: hint,
        hintStyle: GoogleFonts.roboto().copyWith(
            color: labelColor ?? AppColor.black, fontWeight: FontWeight.w400),
      ),
      obscureText: isPassword,
      validator: (_) => isValidate ? validate!(_) : null,
      onFieldSubmitted: (_) => onSubmit!(_) ?? '',
    );
  }
}
