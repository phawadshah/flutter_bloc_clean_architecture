import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/core/presentation/components/media_grid.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class PersonFilmography extends StatelessWidget {
  final List<Media> medias;
  const PersonFilmography({
    super.key,
    required this.medias,
  });

  @override
  Widget build(BuildContext context) {
    return medias.isEmpty
        ? const KEmptyWidget()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(KStrings.filmography, style: context.titleMedium),
              KGaps.small.height,
              KMediaGrid(medias: medias),
            ],
          );
  }
}
