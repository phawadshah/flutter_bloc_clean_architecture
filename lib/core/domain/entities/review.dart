import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String author;
  final String? content;
  final String? id;
  final String? username;
  final num? rating;
  final String? date;

  const Review({
    required this.author,
    this.content,
    this.id,
    this.username,
    this.rating,
    this.date,
  });
  @override
  List<Object?> get props => [author, content, id, username, rating, date];
}
