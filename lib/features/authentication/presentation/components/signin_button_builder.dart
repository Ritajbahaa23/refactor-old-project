import 'package:climatify/core/utils/enums.dart';
import 'package:climatify/features/authentication/presentation/components/signin_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/styles/colors.dart';
import '../controller/authentication/authentication_bloc.dart';
import '../controller/authentication/authentication_states.dart';

class SignInButtonBuilder extends StatelessWidget {
  const SignInButtonBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationStates>(
      builder: (context, state) {
        final AuthenticationBloc authenticationBloc =
            context.read<AuthenticationBloc>();
        switch (authenticationBloc.state.loginState) {
          case RequestState.initial:
            return const SignInButton();
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.basicColor,
              ),
            );
          case RequestState.loaded:
            return const SignInButton();
          case RequestState.error:
            return const SignInButton();
        }
      },
    );
  }
}
