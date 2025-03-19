import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/core/presentation/components/media_card.dart';
import 'package:sgm_block/core/presentation/components/media_grid.dart';
import 'package:sgm_block/core/presentation/components/section_title.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class RelatedMovies extends StatelessWidget {
  final List<Media> medias;
  const RelatedMovies({
    super.key,
    required this.medias,
  });

  @override
  Widget build(BuildContext context) {
    return medias.isEmpty
        ? const KEmptyWidget()
        : Column(
            children: [
              const KSectionTitle(title: KStrings.related),
              KGaps.small.height,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: KPaddings.sideDefault),
                child: KMediaGrid(medias: medias),
              ),
            ],
          );
  }
}
