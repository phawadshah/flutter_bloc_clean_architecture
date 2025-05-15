import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/list_view.dart';
import 'package:sgm_block/core/presentation/components/media_card.dart';
import 'package:sgm_block/core/presentation/components/section_title.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class KMediaSection extends StatelessWidget {
  final String title;
  final List<Media> medias;
  final void Function()? onTap;

  const KMediaSection({
    super.key,
    required this.title,
    required this.medias,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KSectionTitle(
          title: getMediaTitle(title, isMovie: medias.any((e) => e.isMovie)),
          onTap: () {
            navigateToMediaListView(context, title.toLowerCase(),
                isMovie: medias.any((e) => e.isMovie));
          },
        ),
        KGaps.small.height,
        KListView(
          itemCount: medias.length,
          itemBuilder: (context, index) {
            Media media = medias[index];
            return Padding(
              padding: listPadding(index, medias.length),
              child: KMediaCard(media: media),
            );
          },
        ),
        KGaps.betweenSections.height,
      ],
    );
  }
}
