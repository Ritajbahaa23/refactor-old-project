import 'package:climatify/core/localization/app_localization.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/core/utils/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/services/services_locator.dart';

late LocalizationDelegate delegate;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesLocator().init();
  const locale = 'en';
  delegate = await LocalizationDelegate.create(
    fallbackLocale: locale,
    supportedLocales: ['ar', 'en'],
  );
  await delegate.changeLocale(const Locale(locale));
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    required this.appRouter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LocalizedApp(
      delegate,
      LayoutBuilder(builder: (context, constraints) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            delegate,
          ],
          locale: delegate.currentLocale,
          supportedLocales: delegate.supportedLocales,
          onGenerateRoute: appRouter.onGenerateRoute,
          theme: ThemeData(
            fontFamily: 'cairo',
            progressIndicatorTheme: const ProgressIndicatorThemeData(
              color: AppColor.babyBlue,
            ),
            primarySwatch: AppColor.defaultColor,
            textSelectionTheme: const TextSelectionThemeData(
              selectionHandleColor: AppColor.babyBlue,
              cursorColor: AppColor.babyBlue,
              selectionColor: AppColor.babyBlue,
            ),
            colorScheme: ColorScheme.light(
                primary: AppColor.basicColor.withOpacity(0.6),
                onPrimary: AppColor.white,
                surface: AppColor.textFormFieldFilled,
                onSurface: AppColor.black,
                secondary: AppColor.basicColor.withOpacity(0.6)),
            radioTheme: RadioThemeData(
              fillColor: MaterialStateColor.resolveWith(
                (states) => AppColor.indigoDye,
              ),
            ),
            splashColor: AppColor.white,
            scaffoldBackgroundColor: AppColor.white,
            appBarTheme: const AppBarTheme(
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppColor.transparent,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
          ),
        );
      }),
    );
  }
}
