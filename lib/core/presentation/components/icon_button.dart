import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KIconButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function()? onPressed;
  const KIconButton({
    super.key,
    required this.icon,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: KColors.white,
        splashFactory: InkSplash.splashFactory,
        overlayColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KSizes.sizeXXs),
        ),
        disabledBackgroundColor: KColors.transparent,
        disabledForegroundColor: KColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon,
          KGaps.tiny.height,
          Text(title, style: context.bodyMedium),
        ],
      ),
    );
  }
}
