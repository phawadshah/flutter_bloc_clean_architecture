import 'package:sgm_block/features/movies/data/models/movie_model.dart';
import 'package:sgm_block/features/persons/domain/entities/person.dart';
import 'package:sgm_block/utils/helper.dart';

class PersonModel extends Person {
  const PersonModel({
    required super.id,
    required super.name,
    required super.img,
    required super.biography,
    required super.birthday,
    required super.deathday,
    required super.placeOfBirth,
    required super.gender,
    required super.knownFor,
    super.media = const [],
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      id: json['id'] as int,
      name: json['name'] as String,
      img: getCastProfileImageUrl(json),
      biography: json["biography"] as String?,
      birthday: json["birthday"] as String?,
      deathday: json['deathday'] as String?,
      placeOfBirth: json['place_of_birth'] as String?,
      gender: getGender(json['gender'] as int?),
      knownFor: json['known_for_department'] as String?,
      media: ((json["credits"]["cast"] as List)
          .map((cast) => MovieModel.fromJson(cast))).take(20).toList(),
    );
  }
}
