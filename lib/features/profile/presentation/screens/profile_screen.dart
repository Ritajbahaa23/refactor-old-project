import 'package:climatify/core/shared/components/custom_app_bar.dart';
import 'package:climatify/core/utils/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/profile_bloc/profile_bloc.dart';
import '../controller/profile_bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        ///TODO:USE REFER
        // final ProfileBloc profileBloc = context.read<ProfileBloc>();
        return Scaffold(
          appBar: CustomAppBar(
              appBarWidget: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Screens.settings);
                  },
                  icon: const Icon(Icons.settings))
            ],
          )),
          body: const Center(
            child: Text('PROFILE'),
          ),
        );
      },
    );
  }
}
