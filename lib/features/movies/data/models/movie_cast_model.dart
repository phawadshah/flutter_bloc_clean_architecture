import 'package:sgm_block/features/movies/domain/entities/movie_cast.dart';
import 'package:sgm_block/utils/helper.dart';

class MovieCastModel extends MovieCast {
  const MovieCastModel({
    required super.id,
    required super.img,
  });

  factory MovieCastModel.fromJson(Map<String, dynamic> json) => MovieCastModel(
        id: json['id'],
        img: getCastProfileImage(json),
      );
}
