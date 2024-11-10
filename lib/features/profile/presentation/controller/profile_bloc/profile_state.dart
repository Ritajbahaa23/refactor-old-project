import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final String profile;

  const ProfileState({
    this.profile = 'Profile',
  });

  ProfileState copyWith({
    String? profile,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
    );
  }

  @override
  List<Object> get props => [profile];
}
