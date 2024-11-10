import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/app_string.dart';
import '../../../../core/styles/colors.dart';
import '../controller/authentication/authentication_events.dart';
import '../controller/authentication/authentication_states.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        final AuthenticationBloc authenticationBloc =
            context.read<AuthenticationBloc>();
        switch (authenticationBloc.state.registerState) {
          case RequestState.initial:
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  if (authenticationBloc.registerFormKey.currentState!
                      .validate()) {
                    authenticationBloc.add(RegisterEvent());
                  }
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.basicColor,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Center(
                    child: Text(
                      AppString.translate(AppString.signUp, context),
                      style: AppStringStyles.signupButtonStyle,
                    ),
                  ),
                ),
              ),
            );
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.basicColor,
              ),
            );
          case RequestState.loaded:
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {

                  if (authenticationBloc.registerFormKey.currentState!
                      .validate()) {
                    authenticationBloc.add(RegisterEvent());
                  }
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.basicColor,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Center(
                    child: Text(
                      AppString.translate(AppString.signUp, context),
                      style: AppStringStyles.signupButtonStyle,
                    ),
                  ),
                ),
              ),
            );
          case RequestState.error:
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {

                  if (authenticationBloc.registerFormKey.currentState!
                      .validate()) {
                    authenticationBloc.add(RegisterEvent());
                  }
                },
                child: Container(
                  height: 60.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.basicColor,
                    borderRadius: BorderRadius.circular(60.0),
                  ),
                  child: Center(
                    child: Text(
                      AppString.translate(AppString.signUp, context),
                      style: AppStringStyles.signupButtonStyle,
                    ),
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
