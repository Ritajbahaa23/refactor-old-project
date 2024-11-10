import 'package:equatable/equatable.dart';

class NotificationsState extends Equatable {
  final String notifications;

  const NotificationsState({
    this.notifications = 'Notifications',
  });

  NotificationsState copyWith({
    String? notifications,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object> get props => [notifications];
}
