import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final String settings;

  const SettingsState({
    this.settings = 'Settings',
  });

  SettingsState copyWith({
    String? settings,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
    );
  }

  @override
  List<Object> get props => [settings];
}
