import 'package:equatable/equatable.dart';

class GoogleAuthEntity extends Equatable {
  final String id;
  final int v;
  final List<dynamic> blockedUsers;
  final String city;
  final String country;
  final DateTime dateOfBirth;
  final String email;
  final String firstName;
  final List<dynamic> followers;
  final int followersCount;
  final List<dynamic> following;
  final int followingCount;
  final int influenceRank;
  final bool isVerified;
  final String lastName;
  final bool mutedNotifications;
  final String nationality;
  final List<dynamic> notifications;
  final List<dynamic> posts;
  final String profilePic;
  final int rewardPoints;
  final List<dynamic> saved;
  final List<dynamic> stories;
  final bool termsAndConditions;
  final int termsAndConditionsVersion;
  final String username;

  GoogleAuthEntity({
    required this.id,
    required this.v,
    required this.blockedUsers,
    required this.city,
    required this.country,
    required this.dateOfBirth,
    required this.email,
    required this.firstName,
    required this.followers,
    required this.followersCount,
    required this.following,
    required this.followingCount,
    required this.influenceRank,
    required this.isVerified,
    required this.lastName,
    required this.mutedNotifications,
    required this.nationality,
    required this.notifications,
    required this.posts,
    required this.profilePic,
    required this.rewardPoints,
    required this.saved,
    required this.stories,
    required this.termsAndConditions,
    required this.termsAndConditionsVersion,
    required this.username,
  });

  factory GoogleAuthEntity.fromJson(Map<String, dynamic> json) {
    return GoogleAuthEntity(
      id: json['_id'],
      v: json['__v'],
      blockedUsers: json['blockedUsers'],
      city: json['city'],
      country: json['country'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      email: json['email'],
      firstName: json['firstName'],
      followers: json['followers'],
      followersCount: json['followersCount'],
      following: json['following'],
      followingCount: json['followingCount'],
      influenceRank: json['influenceRank'],
      isVerified: json['isVerified'],
      lastName: json['lastName'],
      mutedNotifications: json['mutedNotifications'],
      nationality: json['nationality'],
      notifications: json['notifications'],
      posts: json['posts'],
      profilePic: json['profilePic'],
      rewardPoints: json['rewardPoints'],
      saved: json['saved'],
      stories: json['stories'],
      termsAndConditions: json['termsAndConditions'],
      termsAndConditionsVersion: json['termsAndConditionsVersion'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      '__v': v,
      'blockedUsers': blockedUsers,
      'city': city,
      'country': country,
      'dateOfBirth': dateOfBirth.toIso8601String(),
      'email': email,
      'firstName': firstName,
      'followers': followers,
      'followersCount': followersCount,
      'following': following,
      'followingCount': followingCount,
      'influenceRank': influenceRank,
      'isVerified': isVerified,
      'lastName': lastName,
      'mutedNotifications': mutedNotifications,
      'nationality': nationality,
      'notifications': notifications,
      'posts': posts,
      'profilePic': profilePic,
      'rewardPoints': rewardPoints,
      'saved': saved,
      'stories': stories,
      'termsAndConditions': termsAndConditions,
      'termsAndConditionsVersion': termsAndConditionsVersion,
      'username': username,
    };
  }

  @override
  List<Object?> get props => [
    id,
    v,
    blockedUsers,
    city,
    country,
    dateOfBirth,
    email,
    firstName,
    followers,
    followersCount,
    following,
    followingCount,
    influenceRank,
    isVerified,
    lastName,
    mutedNotifications,
    nationality,
    notifications,
    posts,
    profilePic,
    rewardPoints,
    saved,
    stories,
    termsAndConditions,
    termsAndConditionsVersion,
    username,
  ];
}
