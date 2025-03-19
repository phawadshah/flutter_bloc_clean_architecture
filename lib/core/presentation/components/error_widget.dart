import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KErrorWidget extends StatelessWidget {
  final String? message;
  final void Function()? onPressed;
  const KErrorWidget({
    super.key,
    this.message,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: KColors.primary,
            size: KSizes.sizeXXXl * 2,
          ),
          Text(
            message ?? KStrings.somethingWentWrong,
            style: context.bodyLarge,
          ),
          KGaps.medium.height,
          if (onPressed != null)
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: KColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(KSizes.sizeXXs),
                ),
              ),
              child: Text(
                KStrings.tryAgain,
                style: context.bodyMedium,
              ),
            ),
        ],
      ),
    );
  }
}
