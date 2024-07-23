import 'package:clean_arch_ex/features/posts/domain/enitities/post_entity.dart';

// ignore: must_be_immutable
class PostModel extends PostEntity {
  PostModel({
    super.userId,
    super.id,
    super.title,
    super.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'] ?? -1,
      id: json['id'] ?? -1,
      title: json['title'] ?? "",
      body: json['body'] ?? "",
    );
  }
}
