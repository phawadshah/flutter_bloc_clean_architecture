import 'package:sgm_block/core/domain/entities/cast.dart';
import 'package:sgm_block/utils/helper.dart';

class CastModel extends Cast {
  const CastModel({required super.id, required super.img});

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
        id: json['id'],
        img: getCastProfileImageUrl(json),
      );
}
