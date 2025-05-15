import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/presentation/components/poster.dart';
import 'package:sgm_block/features/movies/domain/entities/movie_details.dart';
import 'package:sgm_block/features/tv_shows/domain/enitites/tv_show_details.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class KDetailsPoster extends StatelessWidget {
  final MediaDetails mediaDetails;
  const KDetailsPoster({
    super.key,
    required this.mediaDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KPoster(mediaDetails.img),
        Positioned(
          top: kToolbarHeight,
          left: KPaddings.sideDefault,
          child: GestureDetector(
            onTap: () => (context).pop(),
            child: const CircleAvatar(
              backgroundColor: KColors.primaryText,
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: KColors.black,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: KPaddings.sideDefault - 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  mediaDetails.title.toString(),
                  style: context.titleMedium,
                ),
              ),
              if (mediaDetails is MovieDetails)
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: KColors.ratingIconColor,
                    ),
                    Text(
                      mediaDetails.voteAverage.toStringAsFixed(1),
                      style: context.titleSmall,
                    ),
                    KGaps.small.width,
                    Text(
                      getFormatedDateMMMyyyy(
                          mediaDetails.releaseDate.toString()),
                      style: context.titleSmall,
                    ),
                  ],
                ),
              if (mediaDetails is TvShowDetails)
                Row(
                  children: [
                    Text(
                      getSeasonsCount(mediaDetails as TvShowDetails),
                      style: context.titleSmall,
                    ),
                    KGaps.small.width,
                    Text(
                      getEpisodesCount(mediaDetails as TvShowDetails),
                      style: context.titleSmall,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
