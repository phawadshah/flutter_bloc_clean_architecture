import 'package:sgm_block/core/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    required super.author,
    required super.content,
    super.id,
    super.rating,
    super.username,
    super.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'],
      content: json['content'] as String?,
      id: json['id'] as String?,
      username: json["author_details"]['username'] as String?,
      rating: json["author_details"]['rating'] as num?,
      date: json['updated_at'] as String?,
    );
  }
}
