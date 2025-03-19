import 'package:sgm_block/core/domain/entities/review.dart';

class MovieReview extends Review {
  const MovieReview({
    required super.author,
    super.content,
    super.id,
    super.username,
    super.rating,
    super.date,
  });
}
