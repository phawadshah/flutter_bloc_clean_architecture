import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/core/presentation/components/icon_button.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/helper.dart';
import 'package:share_plus/share_plus.dart';

class KDetailsViewButtons extends StatelessWidget {
  final MediaDetails mediaDetails;
  const KDetailsViewButtons({
    super.key,
    required this.mediaDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        KIconButton(
          onPressed: mediaDetails.trailerUrl != null
              ? () => playTrailer(mediaDetails.trailerUrl!)
              : null,
          title: KStrings.trailer,
          icon: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: KPaddings.insideDefault / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(KRadii.sizeS),
              border: Border.all(
                color: KColors.white,
              ),
            ),
            child: const Icon(
              Icons.play_arrow_outlined,
              size: KSizes.sizeXl,
            ),
          ),
        ),
        const KIconButton(
          title: KStrings.myList,
          icon: Icon(
            Icons.add,
            size: KSizes.sizeXl,
          ),
        ),
        KIconButton(
          onPressed: () async {
            await Share.share(mediaDetails.title);
          },
          title: KStrings.share,
          icon: const Icon(
            Icons.ios_share_outlined,
            size: KSizes.sizeXl,
          ),
        ),
      ],
    );
  }
}
