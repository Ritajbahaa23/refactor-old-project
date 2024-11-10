import 'package:bloc/bloc.dart';
import 'package:climatify/features/settings/presentation/controller/settings_bloc/settings_event.dart';
import 'package:climatify/features/settings/presentation/controller/settings_bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  ///TODO: CLEAR DATA AND LOGOUT.
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsEvent>((event, emit) {});
  }
}
