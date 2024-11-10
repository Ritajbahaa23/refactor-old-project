import 'package:climatify/core/utils/screen_args.dart';
import 'package:climatify/core/utils/screens.dart';
import 'package:climatify/features/authentication/presentation/screens/terms_screen.dart';
import 'package:climatify/features/authentication/presentation/screens/verifity_success_screen.dart';
import 'package:climatify/features/authentication/presentation/screens/verify_reset_password.dart';
import 'package:climatify/features/layout/presentation/screens/home_layout.dart';
import 'package:climatify/features/notifications/presentation/screens/notifications_screen.dart';
import 'package:climatify/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/screens/authentication_screen.dart';
import '../../features/authentication/presentation/screens/confirm_password_screen.dart';
import '../../features/authentication/presentation/screens/email_verify_screen.dart';
import '../../features/authentication/presentation/screens/forget_password.dart';
import '../../features/boarding/presentation/screens/entry/entry_screen.dart';
import '../../features/boarding/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Screens.entryScreen:
        return MaterialPageRoute(builder: (_) => const EntryScreen());
      case Screens.authenticationScreen:
        ScreenArguments args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => AuthenticationScreen(
            arguments: args,
          ),
        );
      case Screens.emailVerifyScreen:
        ScreenArguments args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => EmailVerifyScreen(
            arguments: args,
          ),
        );
      case Screens.confirmForgetPasswordScreen:
        ScreenArguments args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => ConfirmPasswordScreen(
            arguments: args,
          ),
        );
      case Screens.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Screens.homeLayout:
        return MaterialPageRoute(builder: (_) =>  HomeLayout());
      case Screens.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());
      case Screens.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case Screens.termsScreen:
        return MaterialPageRoute(builder: (_) => const TermsScreen());
      case Screens.verifySuccessScreen:
        return MaterialPageRoute(builder: (_) => const VerifySuccess());
      case Screens.verify_reset:
        return MaterialPageRoute(builder: (_) => const VerifyReset());
      default:
        return null;
    }
  }
}
