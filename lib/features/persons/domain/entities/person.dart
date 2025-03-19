import 'package:equatable/equatable.dart';
import 'package:sgm_block/core/domain/entities/media.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final String img;
  final String? biography;
  final String? birthday;
  final String? deathday;
  final String? placeOfBirth;
  final String gender;
  final String? knownFor;
  final List<Media> media;

  const Person({
    required this.id,
    required this.name,
    required this.img,
    required this.biography,
    required this.birthday,
    required this.deathday,
    required this.placeOfBirth,
    required this.gender,
    required this.knownFor,
    required this.media,
  });

  @override
  List<Object?> get props => [
        biography,
        birthday,
        deathday,
        id,
        name,
        img,
        placeOfBirth,
        gender,
        knownFor
      ];
}
