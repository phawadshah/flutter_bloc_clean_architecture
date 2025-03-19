import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final int id;
  final String img;

  const Cast({
    required this.id,
    required this.img,
  });

  @override
  List<Object?> get props => [id, img];
}
