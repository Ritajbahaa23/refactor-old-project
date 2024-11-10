import 'package:equatable/equatable.dart';

class ChatState extends Equatable {
  final String chat;

  const ChatState({
    this.chat = 'Chat',
  });

  ChatState copyWith({
    String? chat,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
    );
  }

  @override
  List<Object> get props => [chat];
}
