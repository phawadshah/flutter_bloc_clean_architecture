import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/cast.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/helper.dart';

class KCastCard extends StatelessWidget {
  final Cast cast;

  const KCastCard({
    super.key,
    required this.cast,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToPersonView(context, cast.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KRadii.circular),
        child: KImage(
          cast.img,
          fit: BoxFit.cover,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
