import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media.dart';
import 'package:sgm_block/core/presentation/components/media_card.dart';
import 'package:sgm_block/utils/constants/values.dart';

class KMediaGrid extends StatelessWidget {
  final List<Media> medias;
  final bool shouldScroll;
  const KMediaGrid({
    super.key,
    required this.medias,
    this.shouldScroll = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: shouldScroll
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: medias.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 180,
        crossAxisSpacing: KPaddings.sideDefault,
        mainAxisSpacing: KPaddings.sideDefault,
      ),
      itemBuilder: (context, index) {
        return KMediaCard(media: medias[index], showRating: true);
      },
    );
  }
}
