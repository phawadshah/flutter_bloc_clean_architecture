import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/poster.dart';
import 'package:sgm_block/core/presentation/components/slider.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class KPosterSlider extends StatefulWidget {
  final List<Media> medias;
  const KPosterSlider({
    super.key,
    required this.medias,
  });

  @override
  State<KPosterSlider> createState() => _KPosterSliderState();
}

class _KPosterSliderState extends State<KPosterSlider> {
  int sliderIndex = 0;
  PageController pageController = PageController();

  void onPageChanged(int index) {
    sliderIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        KSlider(
          itemCount: widget.medias.length,
          onPageChanged: (index, controller) {
            onPageChanged(index);
          },
          itemBuilder: (context, itemIndex, p2) {
            Media media = widget.medias[itemIndex];
            return Stack(
              children: [
                GestureDetector(
                  onTap: () => navigateToMediaDetailsView(context, media),
                  child: KPoster(media.img),
                ),
              ],
            );
          },
        ),
        Positioned(
          bottom: 15,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedSmoothIndicator(
              activeIndex: sliderIndex,
              count: widget.medias.length,
              axisDirection: Axis.horizontal,
              effect: const ScrollingDotsEffect(
                activeDotColor: KColors.primary,
                dotColor: KColors.primaryText,
                spacing: 5.0,
                radius: 16.0,
                dotWidth: 6.0,
                dotHeight: 6.0,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: KPaddings.sideDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 230,
                child: Text(
                  widget.medias[sliderIndex].title.toString(),
                  style: context.titleMedium,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    color: KColors.ratingIconColor,
                  ),
                  Text(
                    widget.medias[sliderIndex].voteAverage.toStringAsFixed(1),
                    style: context.titleSmall,
                  ),
                  KGaps.small.width,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
