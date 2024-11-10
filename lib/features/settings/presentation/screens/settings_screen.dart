import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/settings_bloc/settings_bloc.dart';
import '../controller/settings_bloc/settings_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        ///TODO:USE REFER
        // final SettingsBloc settingsBloc = context.read<SettingsBloc>();
        return const Scaffold(
          body: Center(
            child: Text('Settings'),
          ),
        );
      },
    );
  }
}
