import 'package:climatify/core/shared/components/back_button.dart';
import 'package:climatify/core/shared/components/custom_app_bar.dart';
import 'package:climatify/core/styles/app_string.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_events.dart';
import 'package:climatify/features/authentication/presentation/screens/register_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../../../../core/utils/screen_args.dart';
import '../controller/authentication/authentication_bloc.dart';
import '../controller/authentication/authentication_states.dart';
import 'login_screen.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key, this.arguments});

  final ScreenArguments? arguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<AuthenticationBloc>()
        ..add(GetCountriesEvent())
        ..add(GetStatesEvent())
        ..add(GetCitiesEvent()),
      child: BlocConsumer<AuthenticationBloc, AuthenticationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (kDebugMode) {
            // log('________________LOGIN SCREEN STATE__________________$state');
            // log('________________LOGIN SCREEN IS STATE IS INITAL__________________$state');
          }
          return DefaultTabController(
            length: 2,
            initialIndex: arguments!.intMessage,
            child: Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    const CustomAppBar(
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
                    TabBar(
                      indicatorColor: AppColor.basicColor,
                      dividerColor: Colors.white,
                      unselectedLabelColor: AppColor.grey200,
                      labelStyle: AppStringStyles.selectedTabStyle,
                      unselectedLabelStyle: AppStringStyles.unselectedTabStyle,
                      indicatorPadding: EdgeInsets.symmetric(
                          // this is the ratio between the line and the screen width in ui design
                          horizontal:
                              -MediaQuery.of(context).size.width * 0.0569),
                      tabs: [
                        Tab(
                          child: Text(
                            AppString.translate(AppString.signIn, context),
                          ),
                        ),
                        Tab(
                          child: Text(
                            AppString.translate(AppString.signUp, context),
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(

                        children: [
                          LoginScreen(),
                          RegisterScreen(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
