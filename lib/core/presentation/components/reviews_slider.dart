import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sgm_block/core/data/network/api_constants.dart';
import 'package:sgm_block/core/domain/entities/review.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/core/presentation/components/image.dart';
import 'package:sgm_block/core/presentation/components/review_card.dart';
import 'package:sgm_block/core/presentation/components/section_title.dart';
import 'package:sgm_block/features/movies/presentation/views/movie_details_view.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class KReviewsSlider extends StatelessWidget {
  final List<Review> reviews;
  const KReviewsSlider({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return reviews.isEmpty
        ? const KEmptyWidget()
        : Column(
            children: [
              const KSectionTitle(title: KStrings.reviews),
              KGaps.small.height,
              CarouselSlider.builder(
                itemCount: reviews.length,
                options: CarouselOptions(
                  height: 170,
                  padEnds: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8,
                  enlargeFactor: 0.23,
                  initialPage: 0,
                ),
                itemBuilder: (context, index, realIndex) {
                  Review review = reviews[index];
                  return GestureDetector(
                    onTap: () async {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => AlertDialog.adaptive(
                          actionsPadding: EdgeInsets.zero,
                          backgroundColor: KColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          content: Column(
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(KRadii.circular),
                                    child: const KImage(
                                      ApiConstants.avatarPlaceHolder,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                  KGaps.small.width,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                ],
                              ),
                              KGaps.small.height,
                              Row(
                                children: [
                                  Text(
                                    getFormatedDateMMddyyyy(review.date ?? ''),
                                    style: context.bodyMedium,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                              KGaps.small.height,
                              Text(
                                review.content ?? '',
                                style: context.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: KReviewCard(review: review),
                  );
                },
              ),
            ],
          );
  }
}
