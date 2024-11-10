import 'package:climatify/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import 'colors.dart';

class AppString {
  static String appName = 'Climatify';

  static String login = 'login';
  static String loginText = 'loginText';
  static String pleaseBeSureOfData = 'pleaseBeSureOfData';
  static String loginEmailLabel = 'loginEmailLabel';
  static String loginPasswordLabel = 'loginPasswordLabel';
  static String doYouForgetPasswordButton = 'doYouForgetPasswordButton';
  static String userData = 'user_data';
  static String userLogged = 'user_logged';
  static String welcomeToClimatify = 'welcomeToClimatify';
  static String climatifyCommunity = 'climatifyCommunity';
  static String climatifyHub= 'Climatify Hub';
  static String signIn = 'signIn';
  static String signUp = 'signUp';
  static String haveAnAccountAlready = 'haveAnAccountAlready';
  static String orSignInWith = 'orSignInWith';
  static String registerEmailLabel = 'registerEmailLabel';
  static String registerUsernameLabel = 'registerUsernameLabel';
  static String registerDateOfBirthLabel = 'registerDateOfBirthLabel';
  static String registerPasswordLabel = 'registerPasswordLabel';
  static String registerFirstNameLabel = 'registerFirstNameLabel';
  static String registerLastNameLabel = 'registerLastNameLabel';
  static String registerPhoneLabel = 'registerPhoneLabel';
  static String registerVerifyCodeButton = 'registerVerifyCodeButton';
  static String termsTitle = 'The following General Terms & Conditions apply to your use of PEV and all related properties.';
  static String termsDescription1 = 'The following General Terms & Conditions apply to your use of VC4A and all related properties. You are solely responsible for your conduct, and your content on VC4A, and compliance with these terms. By registering with us, or using or browsing VC4A, you acknowledge that you have read, understood, and agree to be bound by these terms. This includes the General Terms & Conditions explained on this page, and the VC4A Terms of Commerce, Disclaimer and Privacy Policy.';
  static String termsDescription2 = 'The following General Terms & Conditions apply to your use of VC4A and all related properties. You are solely responsible for your conduct, and your content on VC4A, and compliance with these terms. By registering with us, or using or browsing VC4A, you acknowledge that you have read, understood, and agree to be bound by these terms. This includes the General Terms & Conditions explained on this page, and the VC4A Terms of Commerce, Disclaimer and Privacy Policy.';


  static  String translate(String key, context) {
    return delegate.currentLocale.languageCode == 'ar'
        ? AppLocalizations.of(context)!.translate(key) ?? key
        : AppLocalizations.of(context)!.translate(key) ?? key;
  }
}
class AppStringStyles {
  static TextStyle welcomeStyle = GoogleFonts.poppins().copyWith(color: AppColor.basicColor,fontSize: 25.0,fontWeight: FontWeight.w700);
  static TextStyle climatifyCommunityStyle = GoogleFonts.poppins().copyWith(color: AppColor.basicColor,fontSize: 28.0,fontWeight: FontWeight.w700,);
  static TextStyle loginButtonStyle = GoogleFonts.poppins().copyWith(color: AppColor.white,fontSize: 18.0,fontWeight: FontWeight.w700);
  static TextStyle signupButtonStyle = GoogleFonts.poppins().copyWith(color: AppColor.white,fontSize: 18.0,fontWeight: FontWeight.w700);
  static TextStyle selectedTabStyle = GoogleFonts.poppins().copyWith(color: AppColor.basicColor,fontSize: 20.0,fontWeight: FontWeight.w700);
  static TextStyle signupEntryButtonStyle = GoogleFonts.openSans().copyWith(color: AppColor.white,fontSize: 18.0,fontWeight: FontWeight.w700);
  static TextStyle haveAnAccountAlreadyStyle = GoogleFonts.openSans().copyWith(color: AppColor.shadedGrey,fontSize: 14.0,fontWeight: FontWeight.w400);
  static TextStyle unselectedTabStyle = GoogleFonts.poppins().copyWith(color: AppColor.shadedGrey,fontSize: 20.0,fontWeight: FontWeight.w700);
  static TextStyle signInButtonStyle = GoogleFonts.openSans().copyWith(color: AppColor.basicColor,fontSize: 14.0,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,decorationColor: AppColor.basicColor,);
  static TextStyle doYouForgetPasswordButtonStyle = GoogleFonts.poppins().copyWith(color: AppColor.basicColor,fontSize: 14.0,fontWeight: FontWeight.w500,decoration: TextDecoration.underline,decorationColor: AppColor.basicColor);
  static TextStyle orSignInWithStyle = GoogleFonts.inter().copyWith(color: AppColor.black,fontSize: 16.0,fontWeight: FontWeight.w400,);

}
