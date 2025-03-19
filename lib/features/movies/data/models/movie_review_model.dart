import 'package:sgm_block/features/movies/domain/entities/movie_review.dart';

class MovieReviewModel extends MovieReview {
  const MovieReviewModel({
    required super.author,
    required super.content,
    super.id,
    super.rating,
    super.username,
    super.date,
  });

  factory MovieReviewModel.fromJson(Map<String, dynamic> json) {
    return MovieReviewModel(
      author: json['author'],
      content: json['content'] as String?,
      id: json['id'] as String?,
      username: json["author_details"]['username'] as String?,
      rating: json["author_details"]['rating'] as num?,
      date: json['updated_at'] as String?,
    );
  }
}
