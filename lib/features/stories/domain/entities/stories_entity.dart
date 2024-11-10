import 'package:equatable/equatable.dart';
import '../../../home/domain/entities/posts_entity.dart';

class StoriesEntity extends Equatable {
  const StoriesEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Story> data;

  factory StoriesEntity.fromJson(Map<String, dynamic> json) {
    return StoriesEntity(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Story>.from(json["data"]!.map((x) => Story.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}

class Story extends Equatable {
  final String id;
  final String userID;
  final int likesNumber;
  final int sadNumber;
  final int insightfulNumber;
  final int supportNumber;
  final int celebrateNumber;
  final int totalReactions;
  final String media;
  final DateTime createdAt;
  final DateTime expiresAt;
  final bool archived;
  final List<String> mentioned;
  final List<Reaction> reactions;
  final int v;

  const Story({
    required this.id,
    required this.userID,
    required this.likesNumber,
    required this.sadNumber,
    required this.insightfulNumber,
    required this.supportNumber,
    required this.celebrateNumber,
    required this.totalReactions,
    required this.media,
    required this.createdAt,
    required this.expiresAt,
    required this.archived,
    required this.mentioned,
    required this.reactions,
    required this.v,
  });

  // Story copyWith({
  //   String? id,
  //   String? userID,
  //   int? likesNumber,
  //   int? sadNumber,
  //   int? insightfulNumber,
  //   int? supportNumber,
  //   int? celebrateNumber,
  //   int? totalReactions,
  //   String? media,
  //   DateTime? createdAt,
  //   DateTime? expiresAt,
  //   bool? archived,
  //   List<String>? mentioned,
  //   List<Reaction>? reactions,
  //   int? v,
  // }) {
  //   return Story(
  //     id: id ?? this.id,
  //     userID: userID ?? this.userID,
  //     likesNumber: likesNumber ?? this.likesNumber,
  //     sadNumber: sadNumber ?? this.sadNumber,
  //     insightfulNumber: insightfulNumber ?? this.insightfulNumber,
  //     supportNumber: supportNumber ?? this.supportNumber,
  //     celebrateNumber: celebrateNumber ?? this.celebrateNumber,
  //     totalReactions: totalReactions ?? this.totalReactions,
  //     media: media ?? this.media,
  //     createdAt: createdAt ?? this.createdAt,
  //     expiresAt: expiresAt ?? this.expiresAt,
  //     archived: archived ?? this.archived,
  //     mentioned: mentioned ?? this.mentioned,
  //     reactions: reactions ?? this.reactions,
  //     v: v ?? this.v,
  //   );
  // }

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['_id'],
      userID: json['userID'],
      likesNumber: json['likesNumber'],
      sadNumber: json['sadNumber'],
      insightfulNumber: json['insightfulNumber'],
      supportNumber: json['supportNumber'],
      celebrateNumber: json['celebrateNumber'],
      totalReactions: json['totalReactions'],
      media: json['media'],
      createdAt: DateTime.parse(json['createdAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
      archived: json['archived'],
      mentioned: List<String>.from(json['mentioned']),
      reactions: List<Reaction>.from(
          json['reactions'].map((reaction) => Reaction.fromJson(reaction))),
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'userID': userID,
      'likesNumber': likesNumber,
      'sadNumber': sadNumber,
      'insightfulNumber': insightfulNumber,
      'supportNumber': supportNumber,
      'celebrateNumber': celebrateNumber,
      'totalReactions': totalReactions,
      'media': media,
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
      'archived': archived,
      'mentioned': mentioned,
      'reactions': reactions.map((reaction) => reaction.toJson()).toList(),
      '__v': v,
    };
  }

  @override
  List<Object?> get props => [
        id,
        userID,
        likesNumber,
        sadNumber,
        insightfulNumber,
        supportNumber,
        celebrateNumber,
        totalReactions,
        media,
        createdAt,
        expiresAt,
        archived,
        mentioned,
        reactions,
        v,
      ];
}
