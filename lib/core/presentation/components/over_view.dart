import 'package:flutter/material.dart';
import 'package:sgm_block/core/domain/entities/media_details.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KOverViewWidget extends StatelessWidget {
  const KOverViewWidget({
    super.key,
    required this.mediaDetails,
  });

  final MediaDetails mediaDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KPaddings.sideDefault),
      child: Text(
        mediaDetails.overview,
        style: context.bodyMedium,
      ),
    );
  }
}
