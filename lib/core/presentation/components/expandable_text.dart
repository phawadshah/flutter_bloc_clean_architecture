import 'package:flutter/material.dart';
import 'package:sgm_block/core/presentation/components/empty_widget.dart';
import 'package:sgm_block/utils/constants/strings.dart';
import 'package:sgm_block/utils/constants/values.dart';
import 'package:sgm_block/utils/extensions/extensions.dart';

class KExpandableTextWidget extends StatefulWidget {
  final String? text;
  final int maxLines;
  const KExpandableTextWidget({
    super.key,
    required this.text,
    this.maxLines = 3,
  });

  @override
  State<KExpandableTextWidget> createState() => _KExpandableTextWidgetState();
}

class _KExpandableTextWidgetState extends State<KExpandableTextWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    if (widget.text == null || widget.text!.isEmpty) {
      return const KEmptyWidget();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        TextSpan textSpan = TextSpan(
          text: widget.text ?? '',
          style: context.bodyMedium,
        );
        TextPainter textPainter = TextPainter(
          text: textSpan,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(maxWidth: constraints.maxWidth);
        final isTextLong = textPainter.didExceedMaxLines;
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(KStrings.overView, style: context.titleMedium),
            KGaps.small.height,
            Text(
              widget.text!,
              style: context.bodyMedium,
              maxLines: isExpanded ? null : widget.maxLines,
              overflow:
                  isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            if (isTextLong)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'View Less' : 'View More',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            KGaps.betweenSections.height,
          ],
        );
      },
    );
  }
}
