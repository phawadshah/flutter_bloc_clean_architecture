import 'package:flutter/material.dart';
import 'package:sgm_block/core/data/network/api_constants.dart';
import 'package:sgm_block/core/domain/entities/review.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KReviewCard extends StatelessWidget {
  const KReviewCard({
    super.key,
    required this.review,
  });

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KRadii.img),
        border: Border.all(
          color: KColors.primaryText,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(KPaddings.insideDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(KRadii.circular),
                  child: const KImage(
                    ApiConstants.avatarPlaceHolder,
                    height: 40,
                    width: 40,
                  ),
                ),
                KGaps.small.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      review.author,
                      style: context.bodyMedium,
                    ),
                    if (review.username != null)
                      Text(
                        review.username!,
                        style: context.bodySmall,
                      ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.star_rate_rounded,
                  color: KColors.ratingIconColor,
                  size: KSizes.sizeL,
                ),
                Text(
                  "${(review.rating ?? 0).toStringAsFixed(1)}/10.0",
                  style: context.bodyMedium,
                )
              ],
            ),
            KGaps.medium.height,
            Text(
              review.content ?? '',
              style: context.bodyMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
