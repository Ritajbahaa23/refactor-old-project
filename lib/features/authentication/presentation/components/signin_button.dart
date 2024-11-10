import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_bloc.dart';
import 'package:climatify/features/authentication/presentation/controller/authentication/authentication_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/styles/app_string.dart';
import '../../../../core/styles/colors.dart';
import '../controller/authentication/authentication_events.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        final AuthenticationBloc authenticationBloc =
            context.read<AuthenticationBloc>();
        return InkWell(
          onTap: () {
            if (authenticationBloc.formKey.currentState!.validate()) {
              authenticationBloc.add(LoginEvent());
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
                AppString.translate(AppString.signIn, context),
                style: AppStringStyles.loginButtonStyle,
              ),
            ),
          ),
        );
      },
    );
  }
}
