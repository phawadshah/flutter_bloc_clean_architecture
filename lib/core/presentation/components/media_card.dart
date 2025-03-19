import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/features/movies/domain/entities/movie.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/features/movies/presentation/views/movies_view.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class KMediaCard extends StatelessWidget {
  final Media media;
  final bool showRating;
  const KMediaCard({
    super.key,
    required this.media,
    this.showRating = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToDetailsView(context, media);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(KRadii.img),
        child: Stack(
          children: [
            KImage(
              media.img,
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
            if (showRating)
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: KSizes.sizeXs, vertical: KSizes.sizeXXXs),
                  decoration: BoxDecoration(
                    color: KColors.primary,
                    borderRadius: BorderRadius.circular(KRadii.sizeS),
                  ),
                  child: Text(
                    media.voteAverage.toStringAsFixed(1),
                    style: context.bodyLarge.copyWith(
                      color: KColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
