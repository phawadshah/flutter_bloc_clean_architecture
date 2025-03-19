import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';
import 'package:sgm_block/utils/helper.dart';

class KPlayButton extends StatelessWidget {
  final String? trailerUrl;
  const KPlayButton({
    super.key,
    this.trailerUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
      child: ElevatedButton(
        onPressed: trailerUrl != null ? () => playTrailer(trailerUrl!) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: KColors.primary,
          foregroundColor: KColors.white,
          iconColor: KColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(KSizes.sizeXXs),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.play_circle_filled_sharp,
              color: KColors.white,
              size: KSizes.sizeL,
            ),
            KGaps.tiny.width,
            Text(
              KStrings.play,
              style: context.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
