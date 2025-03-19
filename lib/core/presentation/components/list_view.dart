import 'package:flutter/material.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KListView extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget? Function(BuildContext, int) itemBuilder;
  const KListView(
      {super.key,
      required this.itemCount,
      required this.itemBuilder,
      this.height = 210});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) {
          return KGaps.large.width;
        },
        itemBuilder: itemBuilder,
      ),
    );
  }
}
