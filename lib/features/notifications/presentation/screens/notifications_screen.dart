import 'package:climatify/features/notifications/presentation/controller/notifications_bloc/notifications_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/notifications_bloc/notifications_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
      builder: (context, state) {
        ///TOdO:USE REFER
        // final NotificationsBloc notificationsBloc =
        //     context.read<NotificationsBloc>();
        return const Scaffold(
          body: Center(
            child: Text('Notifications'),
          ),
        );
      },
    );
  }
}
