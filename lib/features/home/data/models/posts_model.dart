import 'package:climatify/features/home/domain/entities/posts_entity.dart';

class PostsModel extends PostsEntity {
  const PostsModel({
    required super.success,
    required super.message,
    required super.data,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      success: json["success"],
      message: json["message"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );
  }
}
