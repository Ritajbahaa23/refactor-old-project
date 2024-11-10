import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/chat_bloc/chat_bloc.dart';
import '../controller/chat_bloc/chat_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        ///TODO:USE REFER
        // final ChatBloc chatBloc = context.read<ChatBloc>();
        return const Scaffold(
          body: Center(
            child: Text('CHAT'),
          ),
        );
      },
    );
  }
}
