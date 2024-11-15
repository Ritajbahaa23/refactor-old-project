import 'package:bloc/bloc.dart';
import 'package:climatify/features/profile/presentation/controller/profile_bloc/profile_event.dart';
import 'package:climatify/features/profile/presentation/controller/profile_bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<ProfileEvent>((event, emit) {});
  }
}
