import 'package:climatify/core/services/services_locator.dart';
import 'package:climatify/core/styles/colors.dart';
import 'package:climatify/core/utils/screen_args.dart';
import 'package:climatify/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/styles/app_string.dart';
import '../../../../../core/utils/screens.dart';
import '../../controller/base_bloc/base_bloc.dart';
import '../../controller/base_bloc/base_state.dart';


class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BaseBloc>(),
      child: BlocBuilder<BaseBloc, BaseState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          AppString.translate(
                              AppString.climatifyCommunity, context),
                          style: AppStringStyles.climatifyCommunityStyle,
                        ),
                        const SizedBox(
                          height: 82.0,
                        ),
                        const Image(
                          image: AssetImage(
                            Assets.imagesLogo,
                          ),
                          height: 200.0,
                          width: 200.0,
                        ),
                        const SizedBox(
                          height: 82.0,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Screens.authenticationScreen,
                                arguments: ScreenArguments(
                                  'Tab Index 1',
                                  'Tab Index 1',
                                  1,
                                ));
                          },
                          overlayColor:
                              MaterialStateProperty.resolveWith((states) {
                            return AppColor.transparent;
                          }),
                          child: Container(
                            height: 48.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.basicColor,
                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: Center(
                              child: Text(
                                AppString.translate(AppString.signUp, context),
                                style: AppStringStyles.signupEntryButtonStyle,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppString.translate(
                                  AppString.haveAnAccountAlready, context),
                              style: AppStringStyles.haveAnAccountAlreadyStyle,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Screens.authenticationScreen,
                                    arguments: ScreenArguments(
                                      'Tab Index 0',
                                      'Tab Index 0',
                                      0,
                                    ));
                              },
                              child: Text(
                                AppString.translate(AppString.signIn, context),
                                style: AppStringStyles.signInButtonStyle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 85.0,
                                color: AppColor.black,
                              ),
                            ),
                            Text(
                              AppString.translate(
                                  AppString.orSignInWith, context),
                              style: AppStringStyles.orSignInWithStyle,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 1.0,
                                width: 85.0,
                                color: AppColor.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: Colors.blue, width: 1.0),
                              ),
                              width: 110.0,
                              height: 40.0,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage(
                                    Assets.imagesFacebook,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 40.0,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                    color: AppColor.shadedGrey, width: 1.0),
                              ),
                              width: 110.0,
                              height: 40.0,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image(
                                  image: AssetImage(
                                    Assets.imagesGoogle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.sizeOf(context).height*.1,)
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
