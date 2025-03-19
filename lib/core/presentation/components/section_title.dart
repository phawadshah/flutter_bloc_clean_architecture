import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/colors.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KSectionTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const KSectionTitle({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
      child: Row(
        children: [
          Text(title, style: context.titleMedium),
          const Spacer(),
          if (onTap != null)
            GestureDetector(
              onTap: onTap,
              child: Text(
                KStrings.seeAll,
                style: context.bodyMedium.copyWith(color: KColors.primary),
              ),
            ),
        ],
      ),
    );
  }
}
