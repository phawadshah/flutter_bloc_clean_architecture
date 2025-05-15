import 'package:flutter/material.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_episode.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class EpisodeCard extends StatelessWidget {
  final TvShowEpisode episode;

  const EpisodeCard({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(KPaddings.insideDefault),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Stack(
                children: [
                  KImage(episode.stillPath, fit: BoxFit.fill),
                  const Center(
                    child: Icon(
                      Icons.play_circle_outline_rounded,
                      size: KSizes.sizeXXXl,
                      color: KColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          KGaps.small.width,
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "[S${episode.seasonNumber}E${episode.episodeNumer}] ",
                      style: context.bodyMedium,
                    ),
                    TextSpan(
                      text: episode.name,
                      style: context.bodyMedium,
                    ),
                  ],
                ),
              ),
              KGaps.small.height,
              if (episode.airDate != null)
                Text(
                  getFormatedDateMMddyyyy(episode.airDate!),
                  style: context.bodySmall,
                ),
              KGaps.small.height,
              Text(
                episode.overview,
                style: context.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
        ],
      ),
    );
  }
}
