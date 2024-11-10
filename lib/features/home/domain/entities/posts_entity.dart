import 'package:equatable/equatable.dart';

class PostsEntity extends Equatable {
  const PostsEntity({
    required this.success,
    required this.message,
    required this.data,
  });

  final bool? success;
  final String? message;
  final List<Datum> data;

  factory PostsEntity.fromJson(Map<String, dynamic> json) {
    return PostsEntity(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
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

class Datum extends Equatable {
  const Datum({
    required this.comments,
    required this.edited,
    required this.sharedFrom,
    required this.isShared,
    required this.id,
    required this.userId,
    required this.content,
    required this.images,
    required this.imageUrls,
    required this.videos,
    required this.pdfAttachments,
    required this.hashtags,
    required this.likesNumber,
    required this.sadNumber,
    required this.insightfulNumber,
    required this.supportNumber,
    required this.celebrateNumber,
    required this.totalReactions,
    required this.createdAt,
    required this.reactions,
    required this.v,
    required this.commentObjects,
  });

  final List<String> comments;
  final bool? edited;
  final dynamic sharedFrom;
  final bool? isShared;
  final String? id;
  final String? userId;
  final String? content;
  final List<String> images;
  final List<dynamic> imageUrls;
  final List<dynamic> videos;
  final List<dynamic> pdfAttachments;
  final List<String> hashtags;
  final int? likesNumber;
  final int? sadNumber;
  final int? insightfulNumber;
  final int? supportNumber;
  final int? celebrateNumber;
  final int? totalReactions;
  final DateTime? createdAt;
  final List<Reaction> reactions;
  final int? v;
  final List<CommentObject> commentObjects;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      comments: json["comments"] == null
          ? []
          : List<String>.from(json["comments"]!.map((x) => x)),
      edited: json["edited"],
      sharedFrom: json["sharedFrom"],
      isShared: json["isShared"],
      id: json["_id"],
      userId: json["userID"],
      content: json["content"],
      images: json["images"] == null
          ? []
          : List<String>.from(json["images"]!.map((x) => x)),
      imageUrls: json["imageUrls"] == null
          ? []
          : List<dynamic>.from(json["imageUrls"]!.map((x) => x)),
      videos: json["videos"] == null
          ? []
          : List<dynamic>.from(json["videos"]!.map((x) => x)),
      pdfAttachments: json["pdfAttachments"] == null
          ? []
          : List<dynamic>.from(json["pdfAttachments"]!.map((x) => x)),
      hashtags: json["hashtags"] == null
          ? []
          : List<String>.from(json["hashtags"]!.map((x) => x)),
      likesNumber: json["likesNumber"],
      sadNumber: json["sadNumber"],
      insightfulNumber: json["insightfulNumber"],
      supportNumber: json["supportNumber"],
      celebrateNumber: json["celebrateNumber"],
      totalReactions: json["totalReactions"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      reactions: json["reactions"] == null
          ? []
          : List<Reaction>.from(
              json["reactions"]!.map((x) => Reaction.fromJson(x))),
      v: json["__v"],
      commentObjects: json["commentObjects"] == null
          ? []
          : List<CommentObject>.from(json["commentObjects"]!
              .map((x) => x == null ? null : CommentObject.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "comments": comments.map((x) => x).toList(),
        "edited": edited,
        "sharedFrom": sharedFrom,
        "isShared": isShared,
        "_id": id,
        "userID": userId,
        "content": content,
        "images": images.map((x) => x).toList(),
        "imageUrls": imageUrls.map((x) => x).toList(),
        "videos": videos.map((x) => x).toList(),
        "pdfAttachments": pdfAttachments.map((x) => x).toList(),
        "hashtags": hashtags.map((x) => x).toList(),
        "likesNumber": likesNumber,
        "sadNumber": sadNumber,
        "insightfulNumber": insightfulNumber,
        "supportNumber": supportNumber,
        "celebrateNumber": celebrateNumber,
        "totalReactions": totalReactions,
        "createdAt": createdAt?.toIso8601String(),
        "reactions": reactions.map((x) => x.toJson()).toList(),
        "__v": v,
        "commentObjects": commentObjects.map((x) => x.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        comments,
        edited,
        sharedFrom,
        isShared,
        id,
        userId,
        content,
        images,
        imageUrls,
        videos,
        pdfAttachments,
        hashtags,
        likesNumber,
        sadNumber,
        insightfulNumber,
        supportNumber,
        celebrateNumber,
        totalReactions,
        createdAt,
        reactions,
        v,
        commentObjects,
      ];
}

class CommentObject extends Equatable {
  const CommentObject({
    required this.id,
    required this.userId,
    required this.content,
    required this.reactions,
    required this.postId,
    required this.likesNumber,
    required this.sadNumber,
    required this.insightfulNumber,
    required this.supportNumber,
    required this.celebrateNumber,
    required this.totalReactions,
    required this.createdAt,
    required this.v,
  });

  final String? id;
  final String? userId;
  final String? content;
  final List<dynamic> reactions;
  final String? postId;
  final int? likesNumber;
  final int? sadNumber;
  final int? insightfulNumber;
  final int? supportNumber;
  final int? celebrateNumber;
  final int? totalReactions;
  final DateTime? createdAt;
  final int? v;

  factory CommentObject.fromJson(Map<String, dynamic> json) {
    return CommentObject(
      id: json["_id"],
      userId: json["userID"],
      content: json["content"],
      reactions: json["reactions"] == null
          ? []
          : List<dynamic>.from(json["reactions"]!.map((x) => x)),
      postId: json["postID"],
      likesNumber: json["likesNumber"],
      sadNumber: json["sadNumber"],
      insightfulNumber: json["insightfulNumber"],
      supportNumber: json["supportNumber"],
      celebrateNumber: json["celebrateNumber"],
      totalReactions: json["totalReactions"],
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userID": userId,
        "content": content,
        "reactions": reactions.map((x) => x).toList(),
        "postID": postId,
        "likesNumber": likesNumber,
        "sadNumber": sadNumber,
        "insightfulNumber": insightfulNumber,
        "supportNumber": supportNumber,
        "celebrateNumber": celebrateNumber,
        "totalReactions": totalReactions,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
      };

  @override
  List<Object?> get props => [
        id,
        userId,
        content,
        reactions,
        postId,
        likesNumber,
        sadNumber,
        insightfulNumber,
        supportNumber,
        celebrateNumber,
        totalReactions,
        createdAt,
        v,
      ];
}

class Reaction extends Equatable {
  const Reaction({
    required this.userId,
    required this.reactionType,
    required this.id,
    required this.v,
    required this.postId,
  });

  final String? userId;
  final String? reactionType;
  final String? id;
  final int? v;
  final String? postId;

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      userId: json["userID"],
      reactionType: json["reactionType"],
      id: json["_id"],
      v: json["__v"],
      postId: json["postID"],
    );
  }

  Map<String, dynamic> toJson() => {
        "userID": userId,
        "reactionType": reactionType,
        "_id": id,
        "__v": v,
        "postID": postId,
      };

  @override
  List<Object?> get props => [
        userId,
        reactionType,
        id,
        v,
        postId,
      ];
}
